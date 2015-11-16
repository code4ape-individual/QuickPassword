//
//  QPLeftView.m
//  QuickPassword
//
//  Created by Jack on 15/11/15.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "QPLeftView.h"

#import <Masonry.h>

@interface QPLeftView ()
{
    UIButton *_accountBtn;
    UIButton *_passwordBtn;
    
    UIView *_middleLine;
    UIView *_rightLine;
}
@end

@implementation QPLeftView

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
    _accountBtn = [UIButton new];
    _accountBtn.tag = QPLeftViewBtnTypeAccount;
    _accountBtn.titleLabel.textColor = [UIColor blueColor];
    _accountBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_accountBtn setTitle:@"账号" forState:UIControlStateNormal];
    [_accountBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _passwordBtn = [UIButton new];
    _passwordBtn.tag = QPLeftViewBtnTypePassword;
    _passwordBtn.titleLabel.textColor = [UIColor blueColor];
    _passwordBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_passwordBtn setTitle:@"密码" forState:UIControlStateNormal];
    [_passwordBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _middleLine = [UIView new];
    _middleLine.backgroundColor = [UIColor lightGrayColor];
    
    _rightLine = [UIView new];
    _rightLine.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:_accountBtn];
    [self addSubview:_passwordBtn];
    [self addSubview:_middleLine];
    [self addSubview:_rightLine];
    
    [_accountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(_passwordBtn.mas_top);
        make.height.equalTo(_passwordBtn);
    }];
    
    [_passwordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(_accountBtn.mas_bottom);
        make.height.equalTo(_accountBtn);
    }];
    
    [_middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(4);
        make.right.equalTo(self).offset(-4);
        make.top.equalTo(_passwordBtn);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
}

#pragma mark - Action
-(void)btnClick:(UIControl *)btn
{
    if ([self.delegate respondsToSelector:@selector(leftViewBtnDidClick:)])
    {
        [self.delegate leftViewBtnDidClick:(QPLeftViewBtnType)btn.tag];
    }
}

@end
