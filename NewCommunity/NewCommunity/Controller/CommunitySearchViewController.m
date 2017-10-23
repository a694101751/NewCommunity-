//
//  CommunitySearchViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/23.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunitySearchViewController.h"

@interface CommunitySearchViewController ()
@property (nonatomic, strong)UITextField * searchTextFiled;
@end

@implementation CommunitySearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self createSearchView];
    
    if (self.type == SearchRootTypeCommunityIn) {
        _searchTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入社区、小区名称" attributes:@{NSForegroundColorAttributeName:getColor(@"cccccc")}];
    }
    else
    {
        _searchTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入关键字，找找看" attributes:@{NSForegroundColorAttributeName:getColor(@"cccccc")}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  创建搜索框
 */
- (void)createSearchView{
    
    UIView *titelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200*SCREEN_WIDTH/320, 31)];
    _searchTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(-50, 0, titelView.frame.size.width +60, titelView.frame.size.height)];
    _searchTextFiled.font = [UIFont systemFontOfSize:14];
    _searchTextFiled.returnKeyType = UIReturnKeySearch;
    _searchTextFiled.layer.masksToBounds = YES;
    _searchTextFiled.layer.borderWidth = 1;
    _searchTextFiled.backgroundColor = [UIColor colorWithRed:244/255.0 green:245/255.0 blue:246/255.0 alpha:1/1.0];
    _searchTextFiled.layer.borderColor = getColor(@"e5e5e5").CGColor;
    _searchTextFiled.layer.cornerRadius = 15;
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 36, 16)];
    
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"InformationRoot_search_bg"]];
    leftImage.frame = CGRectMake(10, 0, 16, 16);
    [leftView addSubview:leftImage];
    _searchTextFiled.leftView = leftView;
    _searchTextFiled.leftViewMode = UITextFieldViewModeAlways;
    [titelView addSubview:_searchTextFiled];
    self.navigationItem.titleView = titelView;
}
- (IBAction)cancelButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
