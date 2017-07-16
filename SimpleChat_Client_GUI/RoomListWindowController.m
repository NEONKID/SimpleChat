//
//  RoomListWindowController.m
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 2017. 6. 1..
//  Copyright © 2017년 1. All rights reserved.
//

#import "RoomListWindowController.h"
#import "ChatRoomWindowController.h"

@interface RoomListWindowController ()

@end

@implementation RoomListWindowController

- (void)setSocket:(int)socket recvSocket:(int)recv_sock recvRoomSock:(int)recv_Room {
    client_socket = socket;
    recvID_sock = recv_sock;
    recvRoom_sock = recv_Room;
}

- (void)setUserID:(NSString *)userID {
    userName = userID;
}

- (void)getRoomList {
    [_roomPopup removeAllItems];
    
    while([[NSThread currentThread] isCancelled] == NO) {
        if(recv(recvRoom_sock, buf_r, 3, 0) <= 0) {
            NSLog(@"Recv Failed !: getRoomList");
            return;
        }
        
        room_Str = [NSString stringWithUTF8String:buf_r];
        memset(buf_r, 0, 3);

        [Room_list addObject:room_Str];
        [_roomPopup addItemsWithTitles:Room_list];
        
        if([[NSThread currentThread] isCancelled] == YES) {
            [chatroomWindow setRoomNum:room_Str];
        }
    }
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    Room_list = [[NSMutableArray alloc]initWithObjects:room_Str, nil];
    
    recvIDList = [[NSThread alloc] initWithTarget:self selector:@selector(getRoomList) object:nil];
    [recvIDList start];
}

- (IBAction)connectBtnClick:(id)sender {
    NSString *selectedItem = [_roomPopup titleOfSelectedItem ];
    
    if(selectedItem == NULL) {
        [self AlertMessage:@"유효하지 않은 방 번호입니다 !" info:@"방 번호가 유효하지 않습니다. 방을 새로 만들어주세요." style:NSAlertStyleCritical];
        return;
    } else {
        buf_w = [selectedItem UTF8String];
        if(send(recvRoom_sock, buf_w, sizeof(buf_w), 3) <= 0) {
            [self AlertMessage:@"서버와 통신에 실패했습니다 !" info:@"서버와 연결이 끊어졌습니다. 네트워크 상태를 확인해주세요." style:NSAlertStyleCritical];
            NSLog(@"Receive room number Error !");
            return;
        }
    }
    
    [recvIDList cancel];
    
    if(!chatroomWindow) {
        chatroomWindow = [[ChatRoomWindowController alloc] initWithWindowNibName:@"ChatRoomWindow"];
    }
    
    [chatroomWindow setSocket:client_socket recvSocket:recvID_sock];
    [chatroomWindow setUserID:userName];
    [chatroomWindow showWindow:self];
    [self close];
}

- (IBAction)makeRoomBtnClick:(id)sender {
    const char createRoomCom[7] = "0x0110";
    
    if(send(recvRoom_sock, createRoomCom, sizeof(createRoomCom), 0) <= 0) {
        [self AlertMessage:@"서버와 통신에 실패했습니다 !" info:@"서버와 연결이 끊어졌습니다. 네트워크 상태를 확인해주세요." style:NSAlertStyleCritical];
        NSLog(@"create Room Error !");
        return;
    }
    
    [recvIDList cancel];
    
    if(!chatroomWindow) {
        chatroomWindow = [[ChatRoomWindowController alloc] initWithWindowNibName:@"ChatRoomWindow"];
    }
    [chatroomWindow setSocket:client_socket recvSocket:recvID_sock];
    [chatroomWindow setUserID:userName];
    [chatroomWindow showWindow:self];
    [self close];
}

- (IBAction)roomChange:(id)sender {
    if([_roomPopup titleOfSelectedItem] == NULL) {
        [_connectBtn setEnabled:NO];
    } else {
        [_connectBtn setEnabled:YES];
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
