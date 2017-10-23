//
//  CommentView.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "ShareMenuView.h"
#import "ShareMenuCollectionViewCell.h"

@interface ShareMenuView()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIView * backView;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, strong)UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, assign)int number;
@end

@implementation ShareMenuView

-(instancetype)initWithTitleArry:(NSArray *)titleArray
{
    self = [super init];
    if (self) {
        self.dataArray = titleArray;
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        _tapGestureRecognizer.delegate = self;
        [self addGestureRecognizer:_tapGestureRecognizer];
        
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = getColor(@"f8f8f8");
        [self addSubview:_backView];
        NSInteger count = titleArray.count;
        _number = (int)ceil(count / 3.0);
        _backView.frame = CGRectMake(0, SCREEN_WIDTH + 218, SCREEN_WIDTH, 141 + _number * 87);
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(0, 24, SCREEN_WIDTH, 17);
        _titleLabel.text = @"分享到";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(16)];
        _titleLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [_backView addSubview:_titleLabel];
        
//        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.itemSize = CGSizeMake(SCREEN_WIDTH / 3, 87);
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 0;
//        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_titleLabel.bounds) + 44, SCREEN_WIDTH, _number * 87) collectionViewLayout:layout];
//        _collectionView.backgroundColor = [UIColor clearColor];
//        _collectionView.dataSource = self;
//        _collectionView.delegate = self;
//        [_collectionView registerClass:[ShareMenuCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ShareMenuCollectionViewCell class])];
//        [_backView addSubview:_collectionView];
        
        CGFloat buttonWidth = SCREEN_WIDTH / titleArray.count;
        if (titleArray.count == 3) {
            buttonWidth = (SCREEN_WIDTH - 50) / titleArray.count;
        }
        else
        {
            buttonWidth = (SCREEN_WIDTH - 30) / titleArray.count;
        }
        for (int i = 0; i < titleArray.count; i ++) {
            NSDictionary * dic = titleArray[i];
            QMUIButton * button = [QMUIButton buttonWithType:UIButtonTypeCustom];
            button.imagePosition = QMUIButtonImagePositionTop;
            button.spacingBetweenImageAndTitle = 18;
            [button setImage:[UIImage imageNamed:dic[@"kImage"]] forState:UIControlStateNormal];
            [button setTitle:dic[@"kTitle"] forState:UIControlStateNormal];
            button.titleLabel.font = Define_SystemIphone6Font12;
            [button setTitleColor:getColor(@"584f60") forState:UIControlStateNormal];
            button.tag = 200 + i;
            [button addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            if (titleArray.count == 3) {
                button.frame = CGRectMake(i * buttonWidth + 25, CGRectGetHeight(_titleLabel.bounds) + 44, buttonWidth, 77);
            }
            else
            {
                button.frame = CGRectMake(i * buttonWidth + 15, CGRectGetHeight(_titleLabel.bounds) + 44, buttonWidth, 77);
            }
            
            [_backView addSubview:button];
        }
        
        UIButton * shutDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shutDownButton setImage:[UIImage imageNamed:@"InformationRoot_shutDown_bg"] forState:UIControlStateNormal];
        [shutDownButton addTarget:self action:@selector(shutDownButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:shutDownButton];
        
        shutDownButton.sd_layout.bottomSpaceToView(_backView, 10)
        .centerXEqualToView(_backView)
        .widthIs(150)
        .heightIs(50);
    }
    return self;
}

//#pragma mark - UICollectionViewDataSource
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.dataArray.count;
//}
//
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    ShareMenuCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ShareMenuCollectionViewCell class]) forIndexPath:indexPath];
//    NSDictionary * dic = self.dataArray[indexPath.row];
//    [cell.button setImage:[UIImage imageNamed:dic[@"kImage"]] forState:UIControlStateNormal];
//    [cell.button setTitle:dic[@"kTitle"] forState:UIControlStateNormal];
//    cell.delegate = self;
//    return cell;
//}

-(void)showShareMenuView
{
    self.hidden = NO;
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
            _backView.frame = CGRectMake(0, SCREEN_HEIGHT - (141 + 87), SCREEN_WIDTH, 141 + 87);
        }];
    });
}

-(void)disappearShareMenuView
{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
            _backView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 141 + 87);
        } completion:^(BOOL finished)
         {
             self.hidden = YES;
         }];
    });
}

#pragma mark - ShareMenuCollectionViewCellDelegate
//-(void)shareMenuButtonClickWithCell:(ShareMenuCollectionViewCell *)cell
//{
//    NSIndexPath * indexPath = [self.collectionView indexPathForCell:cell];
//    NSDictionary * dic = self.dataArray[indexPath.row];
//    if ([self.delegate respondsToSelector:@selector(shareButtonWithTitle:)]) {
//        [self.delegate shareButtonWithTitle:dic[@"kTitle"]];
//    }
//    [self disappearShareMenuView];
//}

-(void)shareButtonClick:(QMUIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(shareButtonWithTitle:)]) {
        [self.delegate shareButtonWithTitle:sender.titleLabel.text];
    }
    [self disappearShareMenuView];
}

//关闭
-(void)shutDownButtonClick
{
    [self disappearShareMenuView];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self shutDownButtonClick];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (touch.view == self.backView) {
        return NO;
    }
    return  YES;
}

@end
