//
//  SubTwoViewController.m
//  Campaign
//
//  Created by Florin on 5/23/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "SubTwoViewController.h"

@implementation SubTwoViewController

- (IBAction)btnBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldUseContentViewFrameForPresentationController:(MZFormSheetPresentationController *)presentationController {
    return YES;
}
- (CGRect)contentViewFrameForPresentationController:(MZFormSheetPresentationController *)presentationController currentFrame:(CGRect)currentFrame {
    currentFrame.size.height = 480;//GTA
    currentFrame.size.width = 350;
    return currentFrame;
}

- (IBAction)btnNext:(id)sender
{
    if ([[self.desView text] length] == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Ludi Notice!" message:@"Please Input Description" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        [self.desView becomeFirstResponder];
        return;
    }
    else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController    *vc = [storyboard instantiateViewControllerWithIdentifier:@"subThreeVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
