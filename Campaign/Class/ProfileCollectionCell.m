//
//  ProfileCollectionCell.m
//  Campaign
//
//  Created by Florin on 5/20/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "ProfileCollectionCell.h"

@implementation ProfileCollectionCell

- (void)awakeFromNib {
    // Initialization code
    self.thumbImg.layer.cornerRadius = 4; // this value vary as per your desire
    self.thumbImg.clipsToBounds = YES;

}

@end
