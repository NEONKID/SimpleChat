//
//  ViewController.m
//  dku_chat_Client_GUI
//
//  Created by Student on 2017. 5. 31..
//  Copyright © 2017년 1. All rights reserved.
//

#import "ConViewController.h"
#import "LoginWindowController.h"
#import "MainViewController.h"

@implementation ConViewController
@synthesize loginWindow;
@synthesize ourViewController = _ourViewController;
@synthesize mainViewController = _mainViewController;
@synthesize ourView = _ourView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    // Do any additional setup after loading the vie
    if((client_socket = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket fail");
        [self AlertMessage:@"소켓을 생성하지 못했습니다 !" info:@"프로그램을 종료합니다, 개발자에게 문의해주세요." style:NSAlertStyleCritical];
        exit(-1);
    }
    
    if((recvUser_sock = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket fail");
        [self AlertMessage:@"소켓을 생성하지 못했습니다 !" info:@"프로그램을 종료합니다, 개발자에게 문의해주세요." style:NSAlertStyleCritical];
        exit(-1);
    }
    
    if((recvRoom_sock = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket fail");
        [self AlertMessage:@"소켓을 생성하지 못했습니다 !" info:@"프로그램을 종료합니다, 개발자에게 문의해주세요." style:NSAlertStyleCritical];
        exit(-1);
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (IBAction)cancelBtnClick:(NSButton *)sender {
    exit(0);
}

- (IBAction)connectBtnClick:(id)sender {
    NSLog(@"Connect function 2");
    
    memset(&server_address, 0, sizeof(server_address));
    
    server_address = [[_ipField stringValue] cStringUsingEncoding:[NSString defaultCStringEncoding]];
    port_num = [_portField intValue];
    
    servaddr.sin_family = AF_INET;
    inet_pton(AF_INET, server_address, &servaddr.sin_addr);
    servaddr.sin_port = htons(port_num);
    
    NSLog(@"Connect function 4");
    
    if(connect(client_socket, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0) {
        perror("Connect fail");
        [self AlertMessage:@"서버와 연결하지 못했습니다.." info:@"IP 주소와 포트 번호를 다시 한 번 확인해주세요." style:NSAlertStyleCritical];
        return;
    }
    
    if(connect(recvUser_sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0) {
        perror("Connect fail");
        [self AlertMessage:@"서버와 연결하지 못했습니다.." info:@"IP 주소와 포트 번호를 다시 한 번 확인해주세요." style:NSAlertStyleCritical];
        return;
    }
    
    if(connect(recvRoom_sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0) {
        perror("Connect fail");
        [self AlertMessage:@"서버와 연결하지 못했습니다.." info:@"IP 주소와 포트 번호를 다시 한 번 확인해주세요." style:NSAlertStyleCritical];
        return;
    }
    
    if(!loginWindow) {
        loginWindow = [[LoginWindowController alloc] initWithWindowNibName:@"LoginWindowController"];
    }
    [loginWindow setSocket:client_socket recvIDSock:recvUser_sock recvRoomSock:recvRoom_sock];
    [loginWindow showWindow:self];
    [_connectBtn setEnabled:NO];
    
    NSLog(@">>>>>> Success connection!!!!!");
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
