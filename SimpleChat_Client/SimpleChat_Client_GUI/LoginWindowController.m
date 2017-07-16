//
//  LoginWindowController.m
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 10/06/2017.
//  Copyright © 2017 1. All rights reserved.
//

#import "LoginWindowController.h"
#import "RoomListWindowController.h"

@interface LoginWindowController ()

@end

@implementation LoginWindowController
@synthesize roomListWindow;

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)setSocket:(int)socket recvIDSock:(int)recv_sock recvRoomSock:(int)recv_Room {
    client_socket = socket;
    recvUserSock = recv_sock;
    recvRoomSock = recv_Room;
}

- (const char*) recvInfo {
    if(recv(client_socket, buf_r, sizeof(buf_r), 0) < 0) {
        [self AlertMessage:@"서버와 연결에 문제가 발생했습니다. " info:@"네트워크 상태를 확인해주세요." style:NSAlertStyleCritical];
        return NULL;
    }
    return buf_r;
}

- (IBAction)authBtnClick:(NSButton *)sender {
    NSString *userid = [_idField stringValue];
    const char login_Success[7] = "0x0011";
    
    client_id = [userid UTF8String];
    
    if(send(client_socket, client_id, 16, 0) < 0) {
        NSLog(@"Sending ID Failed !");
        [self AlertMessage:@"서버와 연결에 문제가 발생했습니다. " info:@"네트워크 상태를 확인해주세요." style:NSAlertStyleCritical];
        return;
    }
    
    if(strncmp([self recvInfo], login_Success, 7) == 0) {
        if(!roomListWindow) {
            roomListWindow = [[RoomListWindowController alloc] initWithWindowNibName:@"RoomListWindow"];
        }
        [roomListWindow setSocket:client_socket recvSocket:recvUserSock recvRoomSock:recvRoomSock];
        [roomListWindow setUserID:userid];
        [roomListWindow showWindow:self];
        [self close];
    } else {
        NSLog(@"Login Failed !");
        [self AlertMessage:@"계정 인증에 실패했습니다 !" info:@"아이디를 다시 한 번 확인해주세요. " style:NSAlertStyleCritical];
        return;
    }
}

- (void)AlertMessage:(NSString*)MessageText info:(NSString*)InformativeText style:(NSAlertStyle)alertStyle {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:MessageText];
    [alert setInformativeText:InformativeText];
    [alert setAlertStyle:alertStyle];
    [alert runModal];
    return;
}

@end
