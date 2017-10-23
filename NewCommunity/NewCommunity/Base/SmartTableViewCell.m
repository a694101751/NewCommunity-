//
//  SmartTableViewCell.m
//  PaintingAddiction
//
//  Created by 李莹 on 14-4-8.
//  Copyright (c) 2014年 Binly Lee. All rights reserved.
//

#import "SmartTableViewCell.h"


@implementation SmartTableViewCell

+(NSString *)cellIdentifier{
    return NSStringFromClass([self class]);
}

+ (id)cellForTableView:(UITableView *)tableView{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[self alloc] initWithCellIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
+(id)cellForRowTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[self alloc] initWithCellIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
- (id) initWithCellIdentifier:(NSString *)cellID{
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
}

+ (CGFloat) heightForCellWithContent:(id)content{
    return 60;
}

@end
