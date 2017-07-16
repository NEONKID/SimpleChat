//
//  MainWindowController.h
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 2017. 6. 1..
//  Copyright © 2017년 1. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController
@property (weak) IBOutlet NSWindow *loginWindow;
- (void)closeWindow;

@end
