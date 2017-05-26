//
//  HomeVideoViewCell.h
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HcdCachePlayer.h"


@interface HomeVideoViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *videoView;

@property (nonatomic,strong) HcdCacheVideoPlayer *play;
@property (weak, nonatomic) IBOutlet UILabel                *likeCount;
@property (weak, nonatomic) IBOutlet UIButton               *btnLike;

+ (HomeVideoViewCell*) homeVideoViewCell;

@end
