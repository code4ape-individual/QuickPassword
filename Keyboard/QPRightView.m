//
//  QPRightView.m
//  QuickPassword
//
//  Created by Jack on 15/11/15.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "QPRightView.h"

#import <Masonry.h>

@interface QPRightView ()
{
    UIButton *_backBtn;
    UIButton *_clearBtn;
    UIButton *_doneBtn;
    
    UIView *_leftLine;
    UIView *_topLine;
    UIView *_middleLine;
}
@end

@implementation QPRightView

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
    _backBtn = [UIButton new];
    _backBtn.tag = QPRightViewBtnTypeBack;
    [_backBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _clearBtn = [UIButton new];
    _clearBtn.tag = QPRightViewBtnTypeClear;
    _clearBtn.titleLabel.textColor = [UIColor blueColor];
    _clearBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_clearBtn setTitle:@"清空" forState:UIControlStateNormal];
    [_clearBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _doneBtn = [UIButton new];
    _doneBtn.tag = QPRightViewBtnTypeDone;
    _doneBtn.titleLabel.textColor = [UIColor blueColor];
    _doneBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_doneBtn setTitle:@"发送" forState:UIControlStateNormal];
    [_doneBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _leftLine = [UIView new];
    _leftLine.backgroundColor = [UIColor lightGrayColor];
    
    _topLine = [UIView new];
    _topLine.backgroundColor = [UIColor lightGrayColor];
    
    _middleLine = [UIView new];
    _middleLine.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:_backBtn];
    [self addSubview:_clearBtn];
    [self addSubview:_doneBtn];
    [self addSubview:_leftLine];
    [self addSubview:_topLine];
    [self addSubview:_middleLine];
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(_clearBtn.mas_top);
        make.height.equalTo(self).multipliedBy(0.25);
    }];
    
    [_clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_backBtn.mas_bottom);
        make.bottom.equalTo(_doneBtn.mas_top);
        make.height.equalTo(self).multipliedBy(0.25);
    }];
    
    [_doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_clearBtn.mas_bottom);
        make.bottom.equalTo(self);
        make.height.equalTo(self).multipliedBy(0.5);
    }];
    
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(self).multipliedBy(0.5);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    
    [_middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
}

#pragma mark - Action
-(void)btnClick:(UIControl *)btn
{
    if ([self.delegate respondsToSelector:@selector(rightViewBtnDidClick:)])
    {
        [self.delegate rightViewBtnDidClick:(QPRightViewBtnType)btn.tag];
    }
}

@end
