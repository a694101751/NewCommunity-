//
//  CommunityLifeDetailsTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/25.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "CommunityLifeDetailsTableViewCell.h"

@interface CommunityLifeDetailsTableViewCell()
@property (nonatomic, strong)UIImageView * headerImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * commentLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@end

@implementation CommunityLifeDetailsTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 35 / 2;
        _headerImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameLabel.textColor = [UIColor colorWithRed:88/255.0 green:79/255.0 blue:96/255.0 alpha:1/1.0];
        [self.contentView addSubview:_nameLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
        [self.contentView addSubview:_contentLabel];
        
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commentLabel.textColor = [UIColor colorWithRed:36/255.0 green:199/255.0 blue:137/255.0 alpha:1/1.0];
        _commentLabel.backgroundColor = getColor(@"fafafa");
        [self.contentView addSubview:_commentLabel];
        
        _headerImageView.sd_layout.leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 15)
        .widthIs(35)
        .heightIs(35);
        
        _nameLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(self.contentView, 26)
        .minWidthIs(100)
        .heightIs(15);
        
        _contentLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(_nameLabel, 16)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        _commentLabel.sd_layout.leftSpaceToView(_headerImageView, 16)
        .topSpaceToView(_contentLabel, 12)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
    }
    return self;
}

-(void)setModel:(CommunityLifeDetailsCommentListPage *)model
{
    _model = model;
    _nameLabel.text = model.userName;
    _contentLabel.text = model.message;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];
    if (model.reply.length > 0) {
        _commentLabel.hidden = NO;
        NSMutableAttributedString * att = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"我 回复 %@：%@", model.userName, model.reply]];
        [att addAttribute:NSForegroundColorAttributeName value:getColor(@"24c789") range:NSMakeRange(0, 1)];
        [att addAttribute:NSForegroundColorAttributeName value:getColor(@"24c789") range:NSMakeRange(5, model.userName.length)];
        [att addAttribute:NSForegroundColorAttributeName value:getColor(@"000000") range:NSMakeRange(2, 2)];
        [att addAttribute:NSForegroundColorAttributeName value:getColor(@"000000") range:NSMakeRange(model.userName.length + 5, att.length - (model.userName.length + 5))];
        _commentLabel.attributedText = att;
    }
    else
    {
        _commentLabel.hidden = YES;
    }
    [self setupAutoHeightWithBottomView:_commentLabel bottomMargin:18];
}

@end
