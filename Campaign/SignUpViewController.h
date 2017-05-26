//
//  SignUpViewController.h
//  Campaign
//
//  Created by Florin on 5/16/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLRadioButton.h"
#import "ActionSheetDatePicker.h"
#import "ActionSheetStringPicker.h"

@interface SignUpViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet DLRadioButton      *manButton;
@property (weak, nonatomic) IBOutlet DLRadioButton      *womenButton;

@property (weak,nonatomic) IBOutlet UIImageView         *userPhoto;
@property (weak, nonatomic) IBOutlet UITextField        *userName;
@property (weak, nonatomic) IBOutlet UITextField        *email;
@property (weak, nonatomic) IBOutlet UITextField        *pwdTxt;
@property (weak, nonatomic) IBOutlet UITextField        *birth;
@property (weak, nonatomic) IBOutlet UIButton           *btnSignUp;
@property (weak, nonatomic) IBOutlet UITextView         *bio;

- (IBAction)btnAddPhoto:(id)sender;
- (IBAction)btnSetBirth:(id)sender;

@end
