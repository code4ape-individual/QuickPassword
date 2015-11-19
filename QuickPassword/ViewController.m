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

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardDidHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardFrameEndUserInfoKey object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardAnimationDurationUserInfoKey object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardAnimationCurveUserInfoKey object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:
     UIKeyboardDidChangeFrameNotification object:nil];
}

- (void)notificationHandler:(NSNotification *)notification
{
    NSLog(@"%@,%@",notification.name,notification.userInfo);
    
    
//    NSLog(@"%@",notification.name);
//    
//    NSString *keys = @"";
//    NSString *values = @"";
//    for (NSString *key in notification.userInfo.allKeys)
//    {
//        keys = [keys stringByAppendingFormat:@"\n%@",key];
//        values = [values stringByAppendingFormat:@"\n%@",notification.userInfo[key]];
//    }
//    
//    NSLog(@"%@",keys);
//    NSLog(@"%@",values);
    
}

@end
