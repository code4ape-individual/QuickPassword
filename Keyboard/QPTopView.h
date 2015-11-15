//
//  QPTopView.h
//  QuickPassword
//
//  Created by Jack on 15/11/14.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    QPTopViewBtnTypeLeft,
    QPTopViewBtnTypeRight
}QPTopViewBtnType;

@protocol QPTopViewDelegate <NSObject>

-(void)topViewBtnDidClick:(QPTopViewBtnType)type;

@end

@interface QPTopView : UIView

@property (nonatomic,weak) id<QPTopViewDelegate> delegate;


-(void)setMiddleText:(NSString *)text textColor:(UIColor *)color;

-(void)clearMiddleText;

@end
