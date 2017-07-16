//
//  ViewController.h
//  dku_chat_Client_GUI
//
//  Created by Student on 2017. 5. 31..
//  Copyright © 2017년 1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <netinet/in.h>

#define MAXLINE 255

@class ChatViewController;
@class LoginWindowController;
@class InfoViewController;

@interface ConViewController : NSViewController {
@private
    char buf_r[MAXLINE + 1], buf_w[MAXLINE + 1];
    struct sockaddr_in servaddr;
    int client_socket, recvUser_sock, recvRoom_sock;
    
    const char *client_id;
    const char *server_address;
    int port_num;
}
@property (weak) IBOutlet NSTextField *ipField;
@property (strong) LoginWindowController *loginWindow;
@property (strong) NSViewController *ourViewController;
@property (strong) NSViewController *mainViewController;
@property (strong) IBOutlet NSTextField *portField;
@property (strong) IBOutlet NSButton *connectBtn;
@property (strong) IBOutlet NSView *ourView;

- (IBAction)cancelBtnClick:(NSButton *)sender;
- (IBAction)connectBtnClick:(id)sender;
@end

