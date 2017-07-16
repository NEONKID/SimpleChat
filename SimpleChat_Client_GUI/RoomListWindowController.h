//
//  RoomListWindowController.h
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 2017. 6. 1..
//  Copyright © 2017년 1. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ChatRoomWindowController;

@interface RoomListWindowController : NSWindowController
{
@public
    
@private
    ChatRoomWindowController *chatroomWindow;
    int client_socket, recvID_sock, recvRoom_sock;
    char buf_r[3];
    const char *buf_w;
    NSMutableArray *Room_list;
    NSMutableArray *ID_list;
    NSString *room_Str;
    NSThread *recvIDList;
    NSString *userName;
}
@property (strong) IBOutlet NSPopUpButton *roomPopup;
@property (weak) IBOutlet NSButton *connectBtn;

- (void)setSocket: (int)socket recvSocket:(int)recv_sock recvRoomSock:(int)recv_Room;
- (void)setUserID: (NSString*)userID;
- (void)getRoomList;

- (IBAction)connectBtnClick:(id)sender;
- (IBAction)makeRoomBtnClick:(id)sender;
- (IBAction)roomChange:(id)sender;

@end
