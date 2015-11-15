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

@interface KeyboardViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIButton *nextKeyboardButton;

@property (nonatomic, strong) NSArray *accountArray;


@property(nonatomic,strong) QPTopView *topView;

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
    
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    
    [self drawSubviews];
}


#pragma mark - Draw
-(void)drawSubviews
{
    // topView
    _topView = [QPTopView new];
    
    // collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor clearColor];
    [collection registerClass:[QPCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collection.delegate = self;
    collection.dataSource = self;
    
    
    
    [self.inputView addSubview:_topView];
    [self.inputView addSubview:collection];
    
    
    
    // constraint
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.inputView);
        make.height.mas_equalTo(40);
    }];
    
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.inputView);
    }];
    
    
}


- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    NSLog(@"%@",NSStringFromCGRect(self.inputView.frame));
}

#pragma mark - Delegate
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
