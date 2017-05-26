//
//  CampTwoViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "CampTwoViewController.h"
#import "SCLAlertView.h"
#import "VideoRecordingController.h"


NSString *kSuccessTitle = @"Add Media";
NSString *kErrorTitle = @"Connection error";
NSString *kNoticeTitle = @"Notice";
NSString *kWarningTitle = @"Warning";
NSString *kInfoTitle = @"Profile Picture";
NSString *kSubtitle = @"Please Select Photo or Video from Camera";
NSString *kButtonTitle = @"Close";
NSString *kAttributeTitle = @"Attributed string operation successfully completed.";

@interface CampTwoViewController ()


@property (weak,nonatomic) IBOutlet UITextField         *des;

@end

@implementation CampTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_des becomeFirstResponder];
    _des.autocorrectionType = UITextAutocorrectionTypeNo;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnAddPhoto:(id)sender
{
    [_des resignFirstResponder];
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.shouldDismissOnTapOutside = YES;
    
    [alert addButton:@"Take Photo" actionBlock:^(void) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = TRUE;
        [self presentModalViewController:picker animated:YES];
        
    }];
    [alert addButton:@"Take Video" actionBlock:^(void) {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController    *VC = [board instantiateViewControllerWithIdentifier:@"videoVC"];
        [self presentModalViewController:VC animated:YES];
        
    }];
    
    [alert alertIsDismissed:^{
        NSLog(@"SCLAlertView dismissed!");
    }];
    
    [alert showInfo:self title:kInfoTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImg = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)btnNext:(id)sender
{
    if ([[self.des text] length] == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Ludi Notice!" message:@"Please Input Campaign Description" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        [self.des becomeFirstResponder];
        return;
    }
    else
    {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *one = [board instantiateViewControllerWithIdentifier:@"campThree"];
        [self.navigationController pushViewController:one animated:YES];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
