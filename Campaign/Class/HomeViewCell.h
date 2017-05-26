//
//  HomeViewCell.h
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UIImageView         *thumbImg;
@property (weak,nonatomic) IBOutlet UILabel             *names;
@property (weak,nonatomic) IBOutlet UILabel             *sport;
@property (weak,nonatomic) IBOutlet UILabel             *des;
@property (weak,nonatomic) IBOutlet UILabel             *date;
@property (weak,nonatomic) IBOutlet UILabel             *subCount;
@property (weak,nonatomic) IBOutlet UIButton            *btnShare;

@end
