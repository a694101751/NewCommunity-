//
//  GovernmentAffairsViewController.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/26.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "GovernmentAffairsViewController.h"
#import "CommunityServiceCollectionViewCell.h"
#import "GovernmentAffairsTableViewCell.h"
#import "HotTopicViewController.h"
#import "CommunityServiceDetailsViewController.h"
#import "CommunityServiceTableViewCell.h"
#import "MainWebViewController.h"
#import "PersonalInformationViewController.h"

@interface GovernmentAffairsViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, SDCycleScrollViewDelegate>
{
    UIButton * currentSelectedButton;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)UIView * headerView;
@property (nonatomic, strong)SDCycleScrollView * sdCycleScrollView;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UIView * buttonBackView;
@property (nonatomic, strong)UIButton * moreButton;
@property (nonatomic, strong)UIView * lineView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)UIButton *loginButton;

@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, strong)NSArray * careArray;
@property (nonatomic, strong)NSArray * urlArray;

@property (nonatomic, strong)UIView * backView;
@property (nonatomic, strong)UILabel * sdcyLabel;
@property (nonatomic, strong)NSMutableArray * sdcyTitleArray;
@end

@interface GovernmentAffairsViewController (network)
@end

@implementation GovernmentAffairsViewController (network)
//政务 话题
-(void)governmentAffairsRoot
{
    [NewCommunityBLL governmentAffairsRootandshowHUDInView:self.view resultPostsWithBlock:^(GovernmentAffairsRootModel *model, NSError *error) {
        if (!error) {
            if ([model.code isEqualToString:@"200"]) {
                NSMutableArray * imageArray = [NSMutableArray array];
                for (GovernmentAffairsRootAdvList * advModel in model.data.advList) {
                    [imageArray addObject:advModel.thumb];
                    NSDictionary * dic = @{@"kTitle":advModel.title, @"kID":advModel.objectId};
                    [self.sdcyTitleArray addObject:dic];
                }
                self.sdCycleScrollView.imageURLStringsGroup = imageArray;
                self.dataArray = model.data.topicList;
                self.careArray = model.data.careList;
                NSDictionary * dic = self.sdcyTitleArray[0];
                self.sdcyLabel.text = dic[@"kTitle"];
            }
            else
            {
                [self showMessage:model.content];
            }
        }
        else
        {
            [self showError:error];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}
@end

@implementation GovernmentAffairsViewController

-(NSMutableArray *)sdcyTitleArray
{
    if (!_sdcyTitleArray) {
        _sdcyTitleArray = [NSMutableArray array];
    }
    return _sdcyTitleArray;
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"GovernmentAffairsTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([GovernmentAffairsTableViewCell class])];
    _tableView.tableFooterView = [UIView new];
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self governmentAffairsRoot];
    }];
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 350)];
    _headerView.backgroundColor = [UIColor whiteColor];
    
    _sdCycleScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / 2.038)];
    _sdCycleScrollView.autoScrollTimeInterval = 3.0f;
    _sdCycleScrollView.delegate = self;
    _sdCycleScrollView.pageControlDotSize = CGSizeMake(3, 3);
    _sdCycleScrollView.pageControlRightOffset = 15;
    _sdCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [_headerView addSubview:_sdCycleScrollView];
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_sdCycleScrollView.frame) - 30, SCREEN_WIDTH, 30)];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [_sdCycleScrollView addSubview:_backView];
    _sdcyLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 50, 30)];
    _sdcyLabel.font = Define_SystemIphone6Font14;
    _sdcyLabel.textColor = [UIColor whiteColor];
    [_backView addSubview:_sdcyLabel];
    
    NSArray * array = @[@"市直服务", @"实用查询", @"各区服务"];
    CGFloat buttonWidth = SCREEN_WIDTH / array.count;
    
    _buttonBackView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_sdCycleScrollView.frame), SCREEN_WIDTH, 48)];
    _buttonBackView.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:_buttonBackView];
    
    for (int i = 0; i < array.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(i * buttonWidth, 12, buttonWidth, 36)];
        [button setTag:200 + i];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:getColor(@"999999") forState:UIControlStateNormal];
        [button setTitleColor:getColor(@"444444") forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Medium" size:14]];
        [button setBackgroundImage:[UIImage imageNamed:@"button_bg"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonBackView addSubview:button];
    }
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 51) / 4, 64);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 7;
    layout.minimumInteritemSpacing = 7;
    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonBackView.frame) + 18, SCREEN_WIDTH, 64) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.scrollEnabled = NO;
    [_headerView addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"CommunityServiceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CommunityServiceCollectionViewCell class])];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_collectionView.frame) + 16, SCREEN_WIDTH, 1)];
    _lineView.backgroundColor = getColor(@"efefef");
    [_headerView addSubview:_lineView];
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreButton setTitle:@"展开更多" forState:UIControlStateNormal];
    [_moreButton setTitle:@"收起" forState:UIControlStateSelected];
    [_moreButton setTitleColor:getColor(@"666666") forState:UIControlStateNormal];
    _moreButton.titleLabel.font = Define_SystemIphone6Font14;
    _moreButton.frame = CGRectMake(0, CGRectGetMaxY(_lineView.frame), SCREEN_WIDTH, 30);
    [_moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:_moreButton];
    
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(_moreButton.frame));
    
    _tableView.tableHeaderView = _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self governmentAffairsRoot];
    UIButton * btn = (UIButton *)[self.headerView viewWithTag:200];
    [self buttonClick:btn];
    _titleArray = @[@"地税局",@"房产局",@"工商局",@"民政局",@"人社局",@"沈阳地铁"];
    _urlArray = @[@"http://www.lnsds.gov.cn/col/col3803/index.html", @"http://www.syfc.com.cn/work/index/index.jsp", @"http://www.sygsj.gov.cn/main.asp?lid=3", @"http://www.symzj.gov.cn/symz/", @"http://www.syhrss.gov.cn/fwdt/xxxc.php", @"http://www.symtc.com/"];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setFrame:CGRectMake(0, 0, SCALE(28), SCALE(28))];
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
    [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.layer.cornerRadius = _loginButton.height / 2;
    _loginButton.layer.masksToBounds = YES;
    UIView * containView = [[UIView alloc]initWithFrame:_loginButton.bounds];
    [containView addSubview:_loginButton];
    
    UIBarButtonItem * loginItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    
    self.navigationItem.leftBarButtonItem = loginItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:@"loginSuccess" object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
}

-(void)loginSuccess:(NSNotification *)noti
{
    [_loginButton sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_default_bg"]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loginSuccess" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)buttonClick:(UIButton *)sender
{
    if (currentSelectedButton)
    {
        currentSelectedButton.selected = NO;
    }
    currentSelectedButton = sender;
    currentSelectedButton.selected = YES;
    switch (sender.tag - 200) {
        case 0:
            _titleArray = @[@"地税局",@"房产局",@"工商局",@"民政局",@"人社局",@"沈阳地铁"];
            _urlArray = @[@"http://www.lnsds.gov.cn/col/col3803/index.html", @"http://www.syfc.com.cn/work/index/index.jsp", @"http://www.sygsj.gov.cn/main.asp?lid=3", @"http://www.symzj.gov.cn/symz/", @"http://www.syhrss.gov.cn/fwdt/xxxc.php", @"http://www.symtc.com/"];
            break;
        case 1:
            _titleArray = @[@"公积金",@"交通违章",@"失业保险",@"养老保险",@"医疗保险"];
            _urlArray = @[@"http://www.sygjj.com/cxxt/personalDetail/personaLogin.jsp", @"http://ln.122.gov.cn/views/inquiry.html", @"http://218.25.90.164/xxcx/sybxcx.html?nsukey=Gm%2B9fR7yYcJexVG1kphO9XVeBSimOxdAlaNbx%2FMbli1xpXhj7ayzxgPvIe50O2zXK%2B4GQvm3U6p1QyNJPm5kk9fkFNC2vqSwJlIoff%2F1rvo0eCjN2oe%2BxSQPBaG0Fhl3TLw5sxlWBvoolhWuE2M1cA%3D%3D", @"http://218.25.120.50/pageconsoleservlet", @"http://www.syyb.gov.cn/perwork.html"];
            break;
        case 2:
            _titleArray = @[@"和平区",@"沈河区",@"皇姑区",@"大东区",@"铁西区",@"浑南区",@"于洪区",@"沈北新区", @"苏家屯"];
            _urlArray = @[@"http://www.syhp.gov.cn/", @"http://www.shenhe.gov.cn/", @"http://www.syhg.gov.cn/HGFont/", @"http://www.sydd.gov.cn/Front/", @"http://www.tiexi.gov.cn/index.php?s=/bss/www.html", @"http://www.hunnan.gov.cn/", @"http://www.syyh.gov.cn/", @"http://www.nsy.gov.cn/", @"http://www.sjtq.gov.cn/"];
            break;
    }
    [self.collectionView reloadData];
    if (self.moreButton.selected) {
        [self moreButtonClick:self.moreButton];
    }
//    NSInteger count = ceil(_titleArray.count / 4.0);
//    _collectionView.frame = CGRectMake(0, CGRectGetMaxY(_buttonBackView.frame) + 30, SCREEN_WIDTH, 64 * count + (count - 1) * 7);
//    _lineView.frame = CGRectMake(0, CGRectGetMaxY(_collectionView.frame) + 16, SCREEN_WIDTH, 1);
//    _moreButton.frame = CGRectMake(0, CGRectGetMaxY(_lineView.frame), SCREEN_WIDTH, 30);
//    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(_moreButton.frame));
//    [_tableView setTableHeaderView:_headerView];
}

-(void)moreButtonClick:(UIButton *)sender
{
    if (sender.selected) {
        _collectionView.frame = CGRectMake(0, CGRectGetMaxY(_buttonBackView.frame) + 30, SCREEN_WIDTH, 64);
        _lineView.frame = CGRectMake(0, CGRectGetMaxY(_collectionView.frame) + 16, SCREEN_WIDTH, 1);
        _moreButton.frame = CGRectMake(0, CGRectGetMaxY(_lineView.frame), SCREEN_WIDTH, 30);
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(_moreButton.frame));
        [_tableView setTableHeaderView:_headerView];
    }
    else
    {
        NSInteger count = ceil(_titleArray.count / 4.0);
        _collectionView.frame = CGRectMake(0, CGRectGetMaxY(_buttonBackView.frame) + 30, SCREEN_WIDTH, 64 * count + (count - 1) * 7);
        _lineView.frame = CGRectMake(0, CGRectGetMaxY(_collectionView.frame) + 16, SCREEN_WIDTH, 1);
        _moreButton.frame = CGRectMake(0, CGRectGetMaxY(_lineView.frame), SCREEN_WIDTH, 30);
         _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(_moreButton.frame));
        [_tableView setTableHeaderView:_headerView];
    }
    sender.selected = ! sender.selected;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityServiceCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CommunityServiceCollectionViewCell class]) forIndexPath:indexPath];
//    cell.titleLabel.text = _titleArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_titleArray[indexPath.row]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainWebViewController * web = [[MainWebViewController alloc]init];
    web.hidesBottomBarWhenPushed = YES;
    web.title = _titleArray[indexPath.row];
    web.urlString = _urlArray[indexPath.row];
    [self.navigationController pushViewController:web animated:YES];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.dataArray.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        GovernmentAffairsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GovernmentAffairsTableViewCell class]) forIndexPath:indexPath];
        GovernmentAffairsRootCareList * model;
        model = self.dataArray[indexPath.row];
        [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
//        cell.titleLabel.text = model.title;
        return cell;
    }
    CommunityServiceTableViewCell * cell = [CommunityServiceTableViewCell cellForTableView:tableView];
    cell.array = self.careArray;
    cell.title = @"政务";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return (SCREEN_WIDTH - 30) / 1.778 + 12;
    }
    NSInteger count = ceil([self.careArray count] / 2.0);
    return 100 * count + (count - 1) * 5 + 28;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 64;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 12)];
    lineView.backgroundColor = getColor(@"efefef");
    [view addSubview:lineView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15, 12, SCREEN_WIDTH, 52);
    label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    label.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
    [view addSubview:label];
    
    QMUIButton * button = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"更多" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"right_bg"] forState:UIControlStateNormal];
    [button setTitleColor:getColor(@"999999") forState:UIControlStateNormal];
    button.titleLabel.font = Define_SystemIphone6Font14;
    button.imagePosition = QMUIButtonImagePositionRight;
    button.spacingBetweenImageAndTitle = 4;
    button.tag = section;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button addTarget:self action:@selector(topicMoreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(SCREEN_WIDTH - 115, 12, 100, 52);
    [view addSubview:button];
    if (section == 0) {
        label.text = @"热点话题";
    }
    else
    {
        label.text = @"政策解读";
    }
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GovernmentAffairsRootCareList * model;
    if (indexPath.section == 0) {
        model = self.dataArray[indexPath.row];
    }
    else
    {
        model = self.careArray[indexPath.row];
    }
    CommunityServiceDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityServiceDetailsViewController class])];
    VC.type = DetailsTypeHotTopic;
    VC.kid = model.idField;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSDictionary * dic = self.sdcyTitleArray[index];
    CommunityServiceDetailsViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommunityServiceDetailsViewController class])];
    VC.type = DetailsTypeHotTopic;
    VC.kid = dic[@"kID"];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSDictionary * dic = self.sdcyTitleArray[index];
    self.sdcyLabel.text = dic[@"kTitle"];
}

-(void)topicMoreButtonClick:(UIButton *)sender
{
    HotTopicViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([HotTopicViewController class])];
    VC.hidesBottomBarWhenPushed = YES;
    if (sender.tag == 0) {
        VC.type = HotTopicTypeHotTopic;
        VC.title = @"热点话题";
    }
    else
    {
        VC.type = HotTopicTypeCareAbout;
        VC.title = @"政策解读";
    }
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)loginButtonClick
{
    if ([User sharedInstanced].ATP_acessToken.length <= 0) {
        [self presentLogin];
    }
    else
    {
        PersonalInformationViewController * VC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PersonalInformationViewController class])];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
