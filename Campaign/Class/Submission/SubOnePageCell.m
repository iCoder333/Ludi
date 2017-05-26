//
//  SubOnePageCell.m
//  Campaign
//
//  Created by Florin on 5/23/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "SubOnePageCell.h"

@implementation SubOnePageCell

- (void)awakeFromNib {
    // Initialization code
    self.thumbImg.layer.cornerRadius = self.thumbImg.frame.size.height / 2;
    self.thumbImg.layer.masksToBounds = YES;
    
}

@end
