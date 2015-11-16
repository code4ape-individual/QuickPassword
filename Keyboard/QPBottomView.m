//
//  QPBottomView.m
//  QuickPassword
//
//  Created by Jack on 15/11/15.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "QPBottomView.h"

#import <Masonry.h>

@interface QPBottomView ()
{
    UIView *_topLine;
}
@end

@implementation QPBottomView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self drawSubviews];
    }
    return self;
}

#pragma mark - Draw
-(void)drawSubviews
{
    _topLine = [UIView new];
    _topLine.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:_topLine];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
}

#pragma mark - Action
-(void)btnClick:(UIControl *)btn
{

}

@end
