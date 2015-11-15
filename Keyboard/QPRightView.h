//
//  QPRightView.h
//  QuickPassword
//
//  Created by Jack on 15/11/15.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    QPRightViewBtnTypeBack,
    QPRightViewBtnTypeClear,
    QPRightViewBtnTypeDone
}QPRightViewBtnType;

@protocol QPRightViewDelegate <NSObject>

-(void)rightViewBtnDidClick:(QPRightViewBtnType)type;

@end

@interface QPRightView : UIView

@property (nonatomic,weak) id<QPRightViewDelegate> delegate;

@end
