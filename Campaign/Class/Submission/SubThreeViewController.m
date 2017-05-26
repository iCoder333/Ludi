//
//  SubThreeViewController.m
//  Campaign
//
//  Created by Florin on 5/23/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "SubThreeViewController.h"

@implementation SubThreeViewController

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)shouldUseContentViewFrameForPresentationController:(MZFormSheetPresentationController *)presentationController {
    return YES;
}
- (CGRect)contentViewFrameForPresentationController:(MZFormSheetPresentationController *)presentationController currentFrame:(CGRect)currentFrame {
    currentFrame.size.height = 480;//GTA
    currentFrame.size.width = 350;
    return currentFrame;
}

@end
