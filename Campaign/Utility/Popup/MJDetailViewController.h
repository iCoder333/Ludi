//
//  MJDetailViewController.h
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJDetailViewController;

@interface MJDetailViewController : UIViewController

@property (assign, nonatomic) id <MJDetailViewController>delegate;

@end

@protocol MJDetailViewController<NSObject>

@optional

- (void)cancelButtonClicked:(MJDetailViewController*)secondDetailViewController;
- (void)cancelButtonClicked1:(MJDetailViewController*)firstDetailViewController;

@end


