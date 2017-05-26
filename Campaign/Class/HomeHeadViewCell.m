//
//  HomeHeadViewCell.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "HomeHeadViewCell.h"

@implementation HomeHeadViewCell

+ (HomeHeadViewCell*) homeHeadViewCell
{
    HomeHeadViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeadViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
