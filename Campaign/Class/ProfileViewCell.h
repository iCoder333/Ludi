//
//  ProfileViewCell.h
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UIImageView         *thumbImg;
@property (weak,nonatomic) IBOutlet UILabel             *names;
@property (weak,nonatomic) IBOutlet UILabel             *sport;
@property (weak,nonatomic) IBOutlet UILabel             *date;

@end
