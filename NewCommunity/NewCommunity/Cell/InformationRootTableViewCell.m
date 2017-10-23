//
//  InformationRootTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/21.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "InformationRootTableViewCell.h"

@interface InformationRootTableViewCell()
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIImageView * titleImageView;
@property (nonatomic, strong)UILabel * commentsLabel;
@property (nonatomic, strong)UILabel * topLabel;
@property (nonatomic, strong)UIView *lineView;
@end

@implementation InformationRootTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(17)];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [self.contentView addSubview:_titleLabel];
        
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.layer.cornerRadius = 5;
        _titleImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_titleImageView];
        
        _commentsLabel = [[UILabel alloc] init];
        _commentsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(10)];
        _commentsLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [self.contentView addSubview:_commentsLabel];
        
        _topLabel = [[UILabel alloc]init];
        _topLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:SCALEIPHONE6(10)];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.textColor = getColor(@"f65858");
        _topLabel.layer.borderWidth = 1;
        _topLabel.layer.borderColor = getColor(@"f65858").CGColor;
        _topLabel.layer.masksToBounds = YES;
        _topLabel.text = @"权威发布";
        [self.contentView addSubview:_topLabel];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1/1.0];
        [self.contentView addSubview:_lineView];
        
        _titleImageView.sd_layout.rightSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 24).widthIs(100).heightIs(100);
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 24).rightSpaceToView(_titleImageView, 24).autoHeightRatio(0);
        
        _topLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(_titleImageView, -14)
        .widthIs(SCALEIPHONE6(52)).heightIs(14);
        
        _commentsLabel.sd_layout.leftSpaceToView(_topLabel, 10).topSpaceToView(_titleImageView, -14).autoWidthRatio(200).heightIs(14);
        
        _lineView.sd_layout.leftSpaceToView(self.contentView, 15).rightSpaceToView(self.contentView, 15).topSpaceToView(@[_commentsLabel, _titleImageView], 16).heightIs(1);

    }
    return self;
}

-(void)setModel:(InformationRootListPost *)model
{
    _model = model;
    if (!self.isTop) {
        _topLabel.hidden = YES;
        _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(_titleImageView, -14).autoWidthRatio(200).heightIs(14);
    }
    else
    {
        _topLabel.hidden = NO;
        _topLabel.text = @"权威发布";
        _commentsLabel.sd_layout.leftSpaceToView(_topLabel, 10).topSpaceToView(_titleImageView, -14).autoWidthRatio(200).heightIs(14);
    }
    _titleLabel.text = model.title;
    _commentsLabel.text = [NSString stringWithFormat:@"%@人评论", model.comment];
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@""]];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

-(void)setCollectionModel:(MyCollectionPost *)collectionModel
{
    _collectionModel = collectionModel;
    _topLabel.hidden = YES;
    _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(@[_titleImageView, _titleLabel], -13).autoWidthRatio(200).heightIs(13);
    _titleLabel.text = collectionModel.title;
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:collectionModel.thumb] placeholderImage:[UIImage imageNamed:@""]];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

-(void)setDetailModel:(DetailsPostRecommendList *)detailModel
{
    _detailModel = detailModel;
    _topLabel.hidden = YES;
    _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(@[_titleImageView, _titleLabel], -13).autoWidthRatio(200).heightIs(13);
    _titleLabel.text = detailModel.name;
    _commentsLabel.text = [NSString stringWithFormat:@"%@人评论", detailModel.comment];
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:detailModel.thumb] placeholderImage:[UIImage imageNamed:@""]];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

-(void)setProjectModel:(ProjectDetailsPostRecommendList *)projectModel
{
    _projectModel = projectModel;
    _topLabel.hidden = YES;
    _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(@[_titleImageView, _titleLabel], -13).autoWidthRatio(200).heightIs(13);
    _titleLabel.text = projectModel.name;
    _commentsLabel.text = [NSString stringWithFormat:@"%@人评论", projectModel.comment];
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:projectModel.thumb] placeholderImage:[UIImage imageNamed:@""]];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

-(void)setTopicModel:(GovernmentAffairsPost *)topicModel
{
    _topicModel = topicModel;
    _topLabel.hidden = YES;
    _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(@[_titleImageView, _titleLabel], -13).autoWidthRatio(200).heightIs(13);
    _titleLabel.text = topicModel.title;
    _commentsLabel.hidden = YES;
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:topicModel.thumb] placeholderImage:[UIImage imageNamed:@""]];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

-(void)setCommunityTopicModel:(CommunityTopicPage *)communityTopicModel
{
    _communityTopicModel = communityTopicModel;
    _topLabel.hidden = YES;
    _commentsLabel.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(@[_titleImageView, _titleLabel], -13).autoWidthRatio(200).heightIs(13);
    _titleLabel.text = communityTopicModel.title;
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:communityTopicModel.thumb] placeholderImage:[UIImage imageNamed:@""]];
    _commentsLabel.text = [NSString stringWithFormat:@"%@人评论", communityTopicModel.commentSum];
    [self setupAutoHeightWithBottomView:_lineView bottomMargin:1];
}

@end
