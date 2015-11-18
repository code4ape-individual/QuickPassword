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
    
    UIButton *_nextKeyboardBtn;
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
    
    _nextKeyboardBtn = [UIButton new];
    _nextKeyboardBtn.tag = QPBottomViewBtnTypeNextKeyboard;
    [_nextKeyboardBtn setImage:[UIImage imageNamed:@"btn_setting"] forState:UIControlStateNormal];
    [_nextKeyboardBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _topLine = [UIView new];
    _topLine.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:_nextKeyboardBtn];
    [self addSubview:_topLine];
    
    [_nextKeyboardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(40);
    }];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
}

#pragma mark - Action
-(void)btnClick:(UIControl *)btn
{
    if ([self.delegate respondsToSelector:@selector(bottomViewBtnDidClick:)])
    {
        [self.delegate bottomViewBtnDidClick:(QPBottomViewBtnType)btn.tag];
    }
}

@end
