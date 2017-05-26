//
//  HomeHeadViewCell.h
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHeadViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel            *creditName;
@property (weak, nonatomic) IBOutlet UILabel            *price;

+ (HomeHeadViewCell*) homeHeadViewCell;

@end
