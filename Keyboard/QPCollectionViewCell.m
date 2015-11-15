//
//  QPCollectionViewCell.m
//  QuickPassword
//
//  Created by Jack on 15/11/14.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "QPCollectionViewCell.h"

#import <Masonry.h>

@interface QPCollectionViewCell ()
{
    UIView *_container;
    UILabel *_titleLabel;
    UIImageView *_bgImage;
}
@end

@implementation QPCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self drawSubviews];
    }
    
    return self;
}

//-(instancetype)init
//{
//    if (self = [super init])
//    {
//        [self drawSubviews];
//    }
//    
//    return self;
//}

-(void)drawSubviews
{
    _container = [UIView new];
    
    UIImage *image = [UIImage imageNamed:@"btn_bg"];
    
    CGFloat halfWidth = image.size.width * 0.5;
    CGFloat halfHeight = image.size.height * 0.5;
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight - 1, halfWidth - 1)];
    
    _bgImage = [[UIImageView alloc] initWithImage:image];
    _titleLabel = [UILabel new];
    
    [self.contentView addSubview:_container];
    [_container addSubview:_bgImage];
    [_container addSubview:_titleLabel];
    
    [_container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.right.bottom.equalTo(_bgImage);
    }];
    
    [_bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_titleLabel).multipliedBy(1.1);
        make.height.mas_equalTo(30);
        make.left.top.equalTo(_container);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_bgImage);
    }];
    
}

- (void)configureCellWithContent:(NSString *)content
{
    _titleLabel.text = content;
}

+ (CGSize)calculateSizeWithContent:(NSString *)content
{
    QPCollectionViewCell *cell = [[QPCollectionViewCell alloc] init];
    [cell configureCellWithContent:content];
    [cell layoutIfNeeded];
    
    return cell.container.bounds.size;
}

@end
