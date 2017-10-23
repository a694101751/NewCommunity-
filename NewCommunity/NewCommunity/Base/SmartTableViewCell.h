//
//  SmartTableViewCell.h
//  PaintingAddiction
//
//  Created by 李莹 on 14-4-8.
//  Copyright (c) 2014年 Binly Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface SmartTableViewCell : UITableViewCell
+ (id) cellForTableView:(UITableView*)tableView;
+ (NSString*)cellIdentifier;
- (id) initWithCellIdentifier:(NSString*)cellID;
+ (CGFloat) heightForCellWithContent:(id)content;

+(id)cellForRowTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath;
@end
