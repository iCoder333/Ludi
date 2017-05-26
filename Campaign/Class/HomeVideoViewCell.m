//
//  HomeVideoViewCell.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "HomeVideoViewCell.h"

@implementation HomeVideoViewCell

+ (HomeVideoViewCell*) homeVideoViewCell
{
    HomeVideoViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeVideoViewCell" owner:self options:nil] objectAtIndex:0];
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
