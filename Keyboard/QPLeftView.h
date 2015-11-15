//
//  QPLeftView.h
//  QuickPassword
//
//  Created by Jack on 15/11/15.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    QPLeftViewBtnTypeAccount,
    QPLeftViewBtnTypePassword
}QPLeftViewBtnType;

@protocol QPLeftViewDelegate <NSObject>

-(void)leftViewBtnDidClick:(QPLeftViewBtnType)type;

@end

@interface QPLeftView : UIView

@property (nonatomic,weak) id<QPLeftViewDelegate> delegate;

@end
