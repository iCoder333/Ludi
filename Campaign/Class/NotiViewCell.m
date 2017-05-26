//
//  NotiViewCell.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "NotiViewCell.h"

@implementation NotiViewCell

- (void)awakeFromNib {
    self.thumbImg.layer.cornerRadius = self.thumbImg.frame.size.height / 2;
    self.thumbImg.layer.masksToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
