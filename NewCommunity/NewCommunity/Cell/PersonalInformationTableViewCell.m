//
//  PersonalInformationTableViewCell.m
//  NewCommunity
//
//  Created by Aaron on 2017/9/20.
//  Copyright © 2017年 ZP. All rights reserved.
//

#import "PersonalInformationTableViewCell.h"

@interface PersonalInformationTableViewCell()
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * contentLabel;
@end

@implementation PersonalInformationTableViewCell

-(instancetype)initWithCellIdentifier:(NSString *)cellID
{
    self = [super initWithCellIdentifier:cellID];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = Define_SystemIphone6Font16;
        _titleLabel.textColor = getColor(@"333333");
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = Define_SystemIphone6Font14;
        _contentLabel.textColor = getColor(@"b2b2b2");
        _contentLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_contentLabel];
        
        _headerImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_headerImageView];
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .heightIs(15)
        .widthIs(50);
        
        _contentLabel.sd_layout.rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .heightIs(15)
        .leftSpaceToView(_titleLabel, 50);
        
        _headerImageView.sd_layout.rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .widthIs(48)
        .heightIs(48);
    }
    return self;
}

-(void)setModel:(NSDictionary *)model
{
    _model = model;
    _titleLabel.text = model[@"kTitle"];
    _contentLabel.text = model[@"kContent"];
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:[User sharedInstanced].ATP_avatar] placeholderImage:[UIImage imageNamed:@"PersonalCenter_default_header"]];;
}

@end
