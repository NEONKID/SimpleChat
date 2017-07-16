//
//  MainViewController.m
//  dku_chat_Client_GUI
//
//  Created by Neon K.I.D on 10/06/2017.
//  Copyright © 2017 1. All rights reserved.
//

#import "MainViewController.h"
#import "ConViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize ourView = _ourView;
@synthesize ourViewController = _ourViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.ourViewController = [[ConViewController alloc] initWithNibName:@"ConViewController" bundle:nil];
    
    [_ourView addSubview:[_ourViewController view]];
    [[_ourViewController view] setFrame:[_ourView bounds]];
    [[_ourViewController view] setTranslatesAutoresizingMaskIntoConstraints:YES];
}

@end
