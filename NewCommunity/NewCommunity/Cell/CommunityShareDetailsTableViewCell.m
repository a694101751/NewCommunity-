//
//  CommunityShareDetailsTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityShareDetailsTableViewCell.h"

@interface CommunityShareDetailsTableViewCell()
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)UIButton * focusButton;
@property (nonatomic, strong)UIImageView * rightImageView;
@property (nonatomic, strong)UIButton * shareButton;
@property (nonatomic, strong)UIView * backView;
@end

@implementation CommunityShareDetailsTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_backView];
        
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor clearColor];
        [_backView addSubview:_titleView];
        
        _focusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_focusButton setTitle:@"关注社区" forState:UIControlStateNormal];
        [_focusButton setTitleColor:getColor(@"333333") forState:UIControlStateNormal];
        _focusButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _focusButton.titleLabel.font = Define_SystemIphone6Font14;
        [_focusButton addTarget:self action:@selector(focusButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_titleView addSubview:_focusButton];
        
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.image = [UIImage imageNamed:@"right_bg"];
        [_titleView addSubview:_rightImageView];
        
        UIView * lineView = [[UIView alloc]init];
        lineView.backgroundColor = getColor(@"efefef");
        [_titleView addSubview:lineView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_backView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
        [_backView addSubview:_contentLabel];
        
        UIView * downLineView = [[UIView alloc]init];
        downLineView.backgroundColor = getColor(@"efefef");
        [_backView addSubview:downLineView];
        
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setTitle:@"分享邻友" forState:UIControlStateNormal];
        [_shareButton setTitleColor:getColor(@"333333") forState:UIControlStateNormal];
        _shareButton.titleLabel.font = Define_SystemIphone6Font14;
        [_shareButton addTarget:self action:@selector(shareButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_shareButton];
        
        _backView.sd_layout.leftSpaceToView(self.contentView, 16)
        .rightSpaceToView(self.contentView, 16)
        .topEqualToView(self.contentView);
        
        _titleView.sd_layout.leftSpaceToView(_backView, 0)
        .rightSpaceToView(_backView, 0)
        .topEqualToView(_backView)
        .heightIs(53);
        
        _focusButton.sd_layout.topEqualToView(_titleView)
        .leftSpaceToView(_titleView, 15)
        .rightSpaceToView(_titleView, 50)
        .heightIs(52);
        
        _rightImageView.sd_layout.rightSpaceToView(_titleView, 15)
        .topSpaceToView(_titleView, 21)
        .widthIs(7)
        .heightIs(12);
        
        lineView.sd_layout.leftSpaceToView(_titleView, 14)
        .rightSpaceToView(_titleView, 14)
        .topSpaceToView(_focusButton, 0)
        .heightIs(1);
        
        _titleLabel.sd_layout.leftSpaceToView(_backView, 14)
        .rightSpaceToView(_backView, 14)
        .topSpaceToView(_titleView, 16)
        .heightIs(23);
        
        _contentLabel.sd_layout.leftSpaceToView(_backView, 14).rightSpaceToView(_backView, 14)
        .topSpaceToView(_titleLabel, 12)
        .autoHeightRatio(0);
        
        downLineView.sd_layout.topSpaceToView(_contentLabel, 20)
        .leftSpaceToView(_backView, 14)
        .rightSpaceToView(_backView, 14)
        .heightIs(1);
        
        _shareButton.sd_layout.topSpaceToView(downLineView, 0)
        .leftSpaceToView(_backView, 0)
        .rightSpaceToView(_backView, 0)
        .heightIs(44);
    }
    return self;
}

-(void)setModel:(CommunityNotificationPost *)model
{
    _model = model;
    _titleLabel.text = model.title;
    NSData * encodeData = [[NSData alloc]initWithBase64EncodedString:model.content options:0];
    NSString * decodedString = [[NSString alloc]initWithData:encodeData encoding:NSUTF8StringEncoding];
    
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[decodedString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    _contentLabel.attributedText = attrStr;
}



-(void)setFocuString:(NSString *)focuString
{
    _focuString = focuString;
    if ([focuString isEqualToString:@"0"]) {
        self.titleView.hidden = YES;
        _titleLabel.sd_layout.leftSpaceToView(_backView, 14)
        .rightSpaceToView(_backView, 14)
        .topSpaceToView(_backView, 16)
        .heightIs(23);
    }
    else
    {
        self.titleView.hidden = NO;
        _titleLabel.sd_layout.leftSpaceToView(_backView, 14)
        .rightSpaceToView(_backView, 14)
        .topSpaceToView(_titleView, 16)
        .heightIs(23);
    }
    [_backView setupAutoHeightWithBottomView:_shareButton bottomMargin:1];
    [self setupAutoHeightWithBottomView:_backView bottomMargin:1];
}

-(void)focusButtonClick
{
    if ([self.delegate respondsToSelector:@selector(focusButtonClick)]) {
        [self.delegate focusButtonClick];
    }
}

-(void)shareButtonClick
{
    if ([self.delegate respondsToSelector:@selector(shareButtonClick)]) {
        [self.delegate shareButtonClick];
    }
}

@end
