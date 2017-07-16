//
//  ChatRoomWindowController.m
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 2017. 6. 1..
//  Copyright © 2017년 1. All rights reserved.
//

#import "ChatRoomWindowController.h"
#import "RoomListWindowController.h"

@interface ChatRoomWindowController ()

@end

@implementation ChatRoomWindowController
@synthesize str;
@synthesize idarray = _idarray;
@synthesize dic = _dic;

- (void)recvMessage {
    Message msg;
    int len = 0;
    char buf[256];
    
    while(YES) {
        len = 0;
        memset(&msg, 0, sizeof(Message));
        memset(&buf, 0, sizeof(buf));
        
        if(recv(client_socket, (char*)&msg, sizeof(Message), 0) <= 0) {
            NSLog(@"Receive fail !");
            return;
        }
        len = strnlen(msg.data, 256);
        strncpy(buf, msg.data, 256);
        buf[len] = 0;
        
        str = [NSString stringWithUTF8String:buf];
        
        [_chatTextView setEditable:YES];
        
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:str];
        [[_chatTextView textStorage] appendAttributedString:attr];
        
        [_chatTextView setEditable:NO];
    }
}

- (void)recvUserList {
    char buf_r[16];
    NSString *_idStr;
    
    while(YES) {
        memset(&buf_r, 0, sizeof(buf_r));
        if(recv(recvID_sock, buf_r, sizeof(buf_r), 0) <= 0) {
            NSLog(@"Receive fail ! : recvUserList");
            return;
        }
        
        _idStr = [NSString stringWithUTF8String:buf_r];
        
        if([[_idarray arrangedObjects] count] == 0) {
            // [_dic setObject:_idStr forKey:@"conID"];
            _dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:_idStr, @"conID", nil];
        }
        
        for(NSDictionary *dict in _idarray.arrangedObjects) {
            NSString *_memStr = [dict objectForKey:@"conID"];
            if([_memStr isEqualToString:_idStr]) {
                NSLog(@"exist !");
            } else {
                // [_dic setObject:_idStr forKey:@"conID"];
                _dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:_idStr, @"conID", nil];
            }
        }
        
        NSArray *listArray = [_dic allValues];
        [_secretIDBox addItemsWithTitles:listArray];
        
        [_idarray addObject:_dic];
    }
}

- (void)displayChatContents {
    [_chatTextView setEditable:YES];
    [_chatTextView insertText:@"" replacementRange:NSRangeFromString(@"")];
    [_chatTextView setEditable:NO];
}

- (void)setSocket:(int)socket recvSocket:(int)recv_sock {
    client_socket = socket;
    recvID_sock = recv_sock;
}

- (void)setUserID:(NSString *)userID {
    userName = userID;
}

- (void)setRoomNum:(NSString *)roomNum {
    roomNumTitle = roomNum;
}

- (void)AlertMessage:(NSString*)MessageText info:(NSString*)InformativeText style:(NSAlertStyle)alertStyle {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:MessageText];
    [alert setInformativeText:InformativeText];
    [alert setAlertStyle:alertStyle];
    [alert runModal];
    return;
}

- (void)createChatView {
    NSSize contentSize = [_chatView contentSize];
    [_chatView setBorderType:NSLineBorder];
    [_chatView setHasVerticalRuler:YES];
    [_chatView setHasHorizontalRuler:NO];
    [_chatView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
    NSRect chatViewFrame = NSMakeRect(0, 0, contentSize.width, contentSize.height);
    self.chatTextView = [[NSTextView alloc] initWithFrame:chatViewFrame];
    [self.chatTextView setMinSize:NSMakeSize(0.0, contentSize.height)];
    [self.chatTextView setMaxSize:NSMakeSize(FLT_MAX,FLT_MAX)];
    [self.chatTextView setVerticallyResizable:YES];
    [self.chatTextView setHorizontallyResizable:NO];
    [self.chatTextView setAutoresizingMask:NSViewWidthSizable];
    [self.chatTextView setEditable:NO];
    
    [_chatView addSubview:self.chatTextView];
    [_chatView setDocumentView:self.chatTextView];
    
    [NSThread detachNewThreadSelector:@selector(recvMessage) toTarget:self withObject:nil];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [_secretIDBox removeAllItems];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(displayChatContents) userInfo:nil repeats:YES];
    [self createChatView];
    
    NSString *title =  [roomNumTitle stringByAppendingString:[NSString stringWithFormat:@"번 방 - %@", userName]];
    [[self window] setTitle:title];

    [NSThread detachNewThreadSelector:@selector(recvUserList) toTarget:self withObject:nil];
    
}

- (IBAction)sendBtnClick:(id)sender {
    NSArray *values = [_dic allValues];
    NSString *val = [_secretIDBox titleOfSelectedItem];
    
    if([values count] == 0) {
        NSLog(@"array is empty !");
        return;
    }
    
    char buf_w[256];
    const char *buf_ID;
    NSString *message = [_chatContent stringValue];
    const char *style = [message UTF8String];
    Message msg;
    memset(&msg, 0, sizeof(Message));
    
    if(![userName isEqualToString:val]) {
        buf_ID = [val UTF8String];
        strncpy(msg.id, buf_ID, 16);
    }
    
    sprintf(buf_w, style, strlen(style));
    if(buf_w != NULL) {
        int len = strnlen(buf_w, 256);
        strncpy(msg.data, buf_w, len);
        msg.data[len] = '\n';
        msg.data[len + 1] = 0;
    }
    
    if(send(client_socket, (const char*)&msg, sizeof(Message), 0) <= 0) {
        NSLog(@"Send Failed !");
        return;
    }
    
    NSLog(@"%@", val);
    [_chatContent setStringValue:@""];

}

- (IBAction)quitBtnClick:(id)sender {
    exit(0);
}

@end
