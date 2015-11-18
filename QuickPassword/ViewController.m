//
//  ViewController.m
//  QuickPassword
//
//  Created by Jack on 15/11/14.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

#import "UIView+Quick.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *line = [UIView createLine];
    line.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
    [self.view addSubview:line];
    
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textFiled];

}

@end
