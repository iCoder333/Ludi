//
//  HomeViewCell.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell

- (void)awakeFromNib {
    // Initialization code
    self.thumbImg.layer.cornerRadius = self.thumbImg.frame.size.height / 2;
    self.thumbImg.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
