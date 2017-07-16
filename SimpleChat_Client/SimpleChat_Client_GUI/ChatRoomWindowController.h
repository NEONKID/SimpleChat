//
//  ChatRoomWindowController.h
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 2017. 6. 1..
//  Copyright © 2017년 1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <sys/socket.h>

@class RoomListWindowController;

typedef struct _MSG {
    char id[16];
    char data[256];
} Message;

@interface ChatRoomWindowController : NSWindowController
{
    int client_socket, recvID_sock;
    NSString *str;
    NSString *userName;
    NSString *roomNumTitle;
    
@private
    RoomListWindowController *roomlistWindow;
    IBOutlet NSTableView *idTableView;
}
@property (copy) NSString *str;
@property (weak) IBOutlet NSTextField *chatContent;
@property (strong) IBOutlet NSScrollView *chatView;
@property (weak) IBOutlet NSScrollView *idView;
@property (strong) IBOutlet NSTextView *chatTextView;
@property (strong) NSTableColumn *txtid;
@property (assign) IBOutlet NSArrayController *idarray;
@property (strong) NSMutableDictionary *dic;
@property (strong) IBOutlet NSPopUpButton *secretIDBox;

- (void)setSocket:(int)socket recvSocket:(int)recv_sock;
- (void)setUserID:(NSString*)userID;
- (void)setRoomNum: (NSString*)roomNum;
- (void)displayChatContents;
- (void)recvMessage;
- (void)recvUserList;
- (void)createChatView;
- (IBAction)sendBtnClick:(id)sender;
- (IBAction)quitBtnClick:(id)sender;

@end
