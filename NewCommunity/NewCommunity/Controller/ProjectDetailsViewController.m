//
//  ProjectDetailsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/10/19.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "ProjectDetailsViewController.h"
#import "InformationRootTableViewCell.h"
#import "DetailsViewController.h"

@interface ProjectDetailsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)UIView * headerView;
@property (nonatomic, strong)UIImageView * imageView;
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)UIView * alphaView;
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, strong)UIBarButtonItem * closeButtonItem;
-(CGFloat)harvestSiteLabelHeight:(NSString *)text width:(CGFloat)width font:(CGFloat)font;
@end

@interface ProjectDetailsViewController (network)
@end

@implementation ProjectDetailsViewController (network)

-(void)projectDetails
{
    [NewCommunityBLL projectDetailsId:self.kId andshowHUDInView:self.view resultPostsWithBlock:^(ProjectDetailsModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.detail.smallThumb] placeholderImage:[UIImage imageNamed:@""]];
                self.titleLabel.text = model.detail.title;
                self.contentLabel.text = model.detail.excerpt;
                self.dataArray = model.postRecommendList;
                self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, [self harvestSiteLabelHeight:model.detail.title width:SCREEN_WIDTH - 30 font:SCALEIPHONE6(20)] + [self harvestSiteLabelHeight:model.detail.excerpt width:SCREEN_WIDTH - 30 font:SCALEIPHONE6(14)] + SCREEN_WIDTH / 3.099 + 67);
                [self.tableView setTableHeaderView:self.headerView];
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView reloadData];
    }];
}

@end

@implementation ProjectDetailsViewController

- (UIView*)alphaView{
    if (!_alphaView) {
        CGRect frame = self.navigationController.navigationBar.frame;
        _alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+20)];
        _alphaView.backgroundColor = [UIColor whiteColor];
        _alphaView.userInteractionEnabled = NO;
        [self.view addSubview:_alphaView];
    }
    return _alphaView;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0.1;
        _tableView.estimatedSectionFooterHeight = 0.1;
    }
    else
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self projectDetails];
    _headerView = [[UIView alloc]init];
    _headerView.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]init];
    [_headerView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:SCALEIPHONE6(20)];
    _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [_headerView addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:SCALEIPHONE6(14)];
    _contentLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
    [_headerView addSubview:_contentLabel];

    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:lineView];
    
    _headerView.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .widthIs(SCREEN_WIDTH)
    .heightIs(SCALEIPHONE6(257));
    
    _imageView.sd_layout.leftEqualToView(_headerView)
    .rightEqualToView(_headerView)
    .topEqualToView(_headerView)
    .heightIs(SCREEN_WIDTH / 3.099);
    
    _titleLabel.sd_layout.leftSpaceToView(_headerView, 15)
    .rightSpaceToView(_headerView, 15)
    .topSpaceToView(_imageView, 16)
    .autoHeightRatio(0);
    
    _contentLabel.sd_layout.leftSpaceToView(_headerView, 15)
    .rightSpaceToView(_headerView, 15)
    .topSpaceToView(_titleLabel, 7)
    .autoHeightRatio(0);
    
    lineView.sd_layout.leftSpaceToView(_headerView, 15)
    .rightSpaceToView(_headerView, 15)
    .topSpaceToView(_contentLabel, 24)
    .heightIs(1);
    
    [_headerView setupAutoHeightWithBottomView:lineView bottomMargin:1];
    [_tableView setTableHeaderView:_headerView];
    
    
    _closeButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"all_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(closeButtonClick)];
    [_closeButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = _closeButtonItem;
    
    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //导航栏透明，但有内容。需要两个配合使用
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
}

- (void)dealloc{
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - KVO

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    CGFloat offset = _tableView.contentOffset.y;
    CGFloat delta = offset / (SCREEN_WIDTH / 3.099);
    delta = MIN(MAX(0, delta), 1) ;
    self.alphaView.alpha = delta;
    if (delta == 1) {
        [self.closeButtonItem setTintColor:[UIColor blackColor]];
        self.navigationItem.title = @"党的十九大视频报道";
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    }
    else
    {
        [self.closeButtonItem setTintColor:[UIColor whiteColor]];
        self.navigationItem.title = @"";
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationRootTableViewCell * cell = [InformationRootTableViewCell cellForTableView:tableView];
    cell.projectModel = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailsViewController class])];
    ProjectDetailsPostRecommendList * model = self.dataArray[indexPath.row];
    VC.kid = [model.postId integerValue];
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)closeButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(CGFloat)harvestSiteLabelHeight:(NSString *)text width:(CGFloat)width font:(CGFloat)font
{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rectToFit.size.height;
}

@end
