//
//  PersonalCenterTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "PersonalCenterTableViewCell.h"

@interface PersonalCenterTableViewCell()
@property (nonatomic, strong)UIImageView * titleImageView;
@property (nonatomic, strong)UILabel * titleLabel;
@end

@implementation PersonalCenterTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        _titleImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_titleImageView];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = Define_SystemIphone6Font16;
        _titleLabel.textColor = getColor(@"333333");
        [self.contentView addSubview:_titleLabel];
        
        _bageLabel = [[UILabel alloc]init];
        _bageLabel.backgroundColor = [UIColor redColor];
        _bageLabel.layer.cornerRadius = 4;
        _bageLabel.layer.masksToBounds = YES;
        [self.contentView addSubview:_bageLabel];
        
        _titleImageView.sd_layout.leftSpaceToView(self.contentView, 10).widthIs(20).heightIs(20).centerYEqualToView(self.contentView);
        _titleLabel.sd_layout.leftSpaceToView(_titleImageView, 10).heightIs(15).widthIs(80).centerYEqualToView(self.contentView);
        _bageLabel.sd_layout.rightSpaceToView(self.contentView, 15)
        .widthIs(8)
        .heightIs(8)
        .centerYEqualToView(self.contentView);
    }
    return self;
}

-(void)setModel:(NSDictionary *)model
{
    _model = model;
    _titleImageView.image = [UIImage imageNamed:model[@"kImage"]];
    _titleLabel.text = model[@"kTitle"];
    [self setupAutoHeightWithBottomView:self.titleImageView bottomMargin:15];
}

@end
