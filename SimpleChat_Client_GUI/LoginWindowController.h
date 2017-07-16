//
//  LoginWindowController.h
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 10/06/2017.
//  Copyright © 2017 1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <netinet/in.h>

#define MAXLINE 255

@class RoomListWindowController;

@interface LoginWindowController : NSWindowController {
@private
    int client_socket, recvUserSock, recvRoomSock;
    char buf_r[MAXLINE + 1], buf_w[MAXLINE + 1];
    struct sockaddr_in servaddr;
    
    const char *client_id;
    const char *server_address;
    int port_num;
}
@property (strong) IBOutlet NSTextField *idField;
@property (strong) RoomListWindowController *roomListWindow;

- (IBAction)authBtnClick:(NSButton *)sender;
- (void)setSocket:(int)socket recvIDSock:(int)recv_sock recvRoomSock:(int)recv_Room;
- (const char*) recvInfo;


@end
