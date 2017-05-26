//
//  SignUpViewController.m
//  Campaign
//
//  Created by Florin on 5/16/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "SignUpViewController.h"


@implementation SignUpViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userPhoto.layer.cornerRadius = _userPhoto.frame.size.height / 2;
    _userPhoto.layer.masksToBounds = YES;
    
    self.btnSignUp.layer.cornerRadius = 4; // this value vary as per your desire
    self.btnSignUp.clipsToBounds = YES;
    
    self.bio.layer.cornerRadius = 4; // this value vary as per your desire
    self.bio.clipsToBounds = YES;
    
    NSAttributedString *username = [[NSAttributedString alloc] initWithString:@"UserName" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.userName.attributedPlaceholder = username;
    
    NSAttributedString *email = [[NSAttributedString alloc] initWithString:@"E-Mail" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.email.attributedPlaceholder = email;
    
    NSAttributedString *birth = [[NSAttributedString alloc] initWithString:@"Date of Birth" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.birth.attributedPlaceholder = birth;
    
    NSAttributedString *password = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.pwdTxt.attributedPlaceholder = password;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAddPhoto:(id)sender
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Profile Photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera" , @"Gallery", nil];
    popup.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [popup showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = TRUE;
        [self presentModalViewController:picker animated:YES];
        
    }
    else if (buttonIndex == 1)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = TRUE;
        [self presentModalViewController:picker animated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImg = info[UIImagePickerControllerEditedImage];
    self.userPhoto.image = selectedImg;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnSetBirth:(id)sender
{
    ActionSheetDatePicker *datePicker = [[ActionSheetDatePicker alloc] initWithTitle:@"Date of Birth" datePickerMode:UIDatePickerModeDate selectedDate:[NSDate date] target:self action:@selector(timeWasSelectedPoin:element:) origin:self.birth];
    datePicker.minuteInterval = 4;
    [datePicker showActionSheetPicker];

}

-(void)timeWasSelectedPoin:(NSDate *)selectedTime element:(id)element
{
    [element setText:[self getStrigFromDate:selectedTime]];
}

- (NSString *) getStrigFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    return [formatter stringFromDate:date];
}


- (IBAction)logSelectedButton:(DLRadioButton *)radioButton {
    if (radioButton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in radioButton.selectedButtons) {
            NSLog(@"%@ is selected.\n", button.titleLabel.text);
        }
    } else {
        NSLog(@"%@ is selected.\n", radioButton.selectedButton.titleLabel.text);
    }
}

@end
