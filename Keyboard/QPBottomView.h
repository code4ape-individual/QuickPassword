//
//  QPBottomView.h
//  QuickPassword
//
//  Created by Jack on 15/11/15.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol QPBottomViewDelegate <NSObject>



@end

@interface QPBottomView : UIView

@property (nonatomic,weak) id<QPBottomViewDelegate> delegate;

@end
