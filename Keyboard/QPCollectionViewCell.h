//
//  QPCollectionViewCell.h
//  QuickPassword
//
//  Created by Jack on 15/11/14.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong,readonly) UIView *container;


- (void)configureCellWithContent:(NSString *)content;

+ (CGSize)calculateSizeWithContent:(NSString *)content;

@end
