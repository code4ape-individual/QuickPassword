//
//  QPTopView.m
//  QuickPassword
//
//  Created by Jack on 15/11/14.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "QPTopView.h"

#import <Masonry.h>

@interface QPTopView ()
{
    UIButton *_leftBtn;
    UIButton *_rightBtn;
    UILabel *_middleLabel;
    
}
@end

@implementation QPTopView

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
    _leftBtn = [UIButton new];
    _rightBtn = [UIButton new];
    _middleLabel = [UILabel new];
    
    _leftBtn.tag = QPTopViewBtnTypeLeft;
    _rightBtn.tag = QPTopViewBtnTypeRight;
    
    [_leftBtn setImage:[UIImage imageNamed:@"btn_setting"] forState:UIControlStateNormal];
    [_rightBtn setImage:[UIImage imageNamed:@"btn_hideKeyboard"] forState:UIControlStateNormal];
    
    [self addSubview:_leftBtn];
    [self addSubview:_rightBtn];
    [self addSubview:_middleLabel];
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(44);
    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.mas_equalTo(44);
    }];
    
    [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.left.greaterThanOrEqualTo(_leftBtn.mas_right);
        make.right.lessThanOrEqualTo(_rightBtn.mas_left);
    }];
}

#pragma mark - Action
-(void)btnClick:(UIControl *)btn
{
    if ([self.delegate respondsToSelector:@selector(topViewBtnDidClick:)])
    {
        [self.delegate topViewBtnDidClick:(QPTopViewBtnType)btn.tag];
    }
}

#pragma mark - Public
-(void)setMiddleText:(NSString *)text textColor:(UIColor *)color
{
    _middleLabel.text = text;
    _middleLabel.textColor = color;
}

-(void)clearMiddleText
{
    [UIView animateWithDuration:0.3 animations:^{
        _middleLabel.alpha = 0;
    } completion:^(BOOL finished) {
        _middleLabel.text = @"";
        _middleLabel.alpha = 1;
    }];
}

@end
