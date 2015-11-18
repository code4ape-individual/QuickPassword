//
//  UIView+Quick.m
//  QuickPassword
//
//  Created by JunjieDeng on 15/11/17.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "UIView+Quick.h"

@implementation UIView (Quick)

+ (UIView *)createLine
{
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    
    return line;
}

@end
