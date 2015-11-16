//
//  KeyboardViewController.m
//  Keyboard
//
//  Created by Jack on 15/11/14.
//  Copyright © 2015年 code4ape-individual. All rights reserved.
//

#import "KeyboardViewController.h"
#import "QPCollectionViewCell.h"
#import <Masonry.h>

#import "QPTopView.h"
#import "QPLeftView.h"
#import "QPRightView.h"
#import "QPBottomView.h"

@interface KeyboardViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,QPTopViewDelegate,QPLeftViewDelegate,QPRightViewDelegate,QPBottomViewDelegate>
@property (nonatomic, strong) UIButton *nextKeyboardButton;

@property (nonatomic, strong) NSArray *accountArray;

@property(nonatomic,strong) QPTopView *topView;
@property(nonatomic,strong) QPLeftView *leftView;
@property(nonatomic,strong) QPRightView *rightView;
@property(nonatomic,strong) QPBottomView *bottomView;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputView.backgroundColor = [UIColor grayColor];
    
    // 加载数据
    self.accountArray = @[
                          @{@"name":@"个人QQ邮箱",@"content":@"104496268@qq.com"},
                          @{@"name":@"个人QQ邮箱别名",@"content":@"slkai@qq.com"},
                          @{@"name":@"CFA邮箱",@"content":@"junjie_deng@qq.com"},
                          @{@"name":@"苹果账号",@"content":@"slkai@qq.com"}
                          ];
    
//    // Perform custom UI setup here
//    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    
//    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
//    [self.nextKeyboardButton sizeToFit];
//    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:self.nextKeyboardButton];
//    
//    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
//    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
//    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    
    [self drawSubviews];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#pragma mark - Draw
-(void)drawSubviews
{
    // topView
    _topView = [QPTopView new];
    _topView.delegate = self;
    
    _leftView = [QPLeftView new];
    _leftView.delegate = self;
    
    _rightView = [QPRightView new];
    _rightView.delegate = self;
    
    _bottomView = [QPBottomView new];
    _bottomView.delegate = self;

    
    // collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor clearColor];
    [collection registerClass:[QPCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collection.delegate = self;
    collection.dataSource = self;
    
    
    
    [self.inputView addSubview:_topView];
    [self.inputView addSubview:_leftView];
    [self.inputView addSubview:_rightView];
    [self.inputView addSubview:_bottomView];
    [self.inputView addSubview:collection];
    
    
    
    // constraint
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.inputView);
        make.height.mas_equalTo(40);
    }];
    
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.inputView);
        make.top.equalTo(_topView.mas_bottom);
        make.bottom.equalTo(_bottomView.mas_top);
        make.width.mas_equalTo(40);
    }];
    
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.inputView);
        make.top.equalTo(_topView.mas_bottom);
        make.bottom.equalTo(self.inputView);
        make.width.mas_equalTo(40);
    }];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.inputView);
        make.height.mas_equalTo(40);
        make.right.equalTo(_rightView.mas_left);
    }];
    
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_right);
        make.right.equalTo(_rightView.mas_left);
        make.top.equalTo(_topView.mas_bottom);
        make.bottom.equalTo(_bottomView.mas_top);
    }];
}


- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    NSLog(@"%@",NSStringFromCGRect(self.inputView.frame));
}

#pragma mark - Delegate
-(void)topViewBtnDidClick:(QPTopViewBtnType)type
{
    switch (type) {
        case QPTopViewBtnTypeLeft:{
            
        } break;
        case QPTopViewBtnTypeRight:{
            [self dismissKeyboard];
        } break;
        default:break;
    }
}

-(void)leftViewBtnDidClick:(QPLeftViewBtnType)type
{

}

-(void)rightViewBtnDidClick:(QPRightViewBtnType)type
{

}

#pragma mark - TableViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.accountArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dict = self.accountArray[indexPath.row];
    NSString *name = dict[@"name"];
    [cell configureCellWithContent:name];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dict = self.accountArray[indexPath.row];
    NSString *name = dict[@"name"];
    return [QPCollectionViewCell calculateSizeWithContent:name];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = self.accountArray[indexPath.row];
    NSString *text = dict[@"content"];
    [self.textDocumentProxy insertText:text];
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
