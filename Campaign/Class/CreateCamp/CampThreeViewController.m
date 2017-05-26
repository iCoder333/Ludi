//
//  CampThreeViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "CampThreeViewController.h"

@interface CampThreeViewController ()

@property (weak,nonatomic) IBOutlet UISegmentedControl  *selSwitch;
@property (weak,nonatomic) IBOutlet UISlider            *videoSlider;
@property (weak,nonatomic) IBOutlet UILabel             *cam_Count;

@end

@implementation CampThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cam_Count.hidden = YES;
    _videoSlider.hidden = YES;

    
    [_videoSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)SegmentChangeViewValueChanged:(UISegmentedControl *)SControl
{
    if (SControl.selectedSegmentIndex==0)
    {
        _cam_Count.hidden = YES;
        _videoSlider.hidden = YES;
    }
    else if (SControl.selectedSegmentIndex==1)
    {
        _cam_Count.hidden = NO;
        _videoSlider.hidden = NO;
    }
    else if (SControl.selectedSegmentIndex==2)
    {
        _cam_Count.hidden = NO;
        _videoSlider.hidden = NO;

    }
    
}

-(void)sliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    int value = [[NSString stringWithFormat:@"%f",slider.value] intValue];
    int stepSize = 1;
    value = (value - value % stepSize);
    _cam_Count.text = [NSString stringWithFormat:@"Video Duration: %ds",value];
}

- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
//    self.userPhoto.image = selectedImg;
    [picker dismissViewControllerAnimated:YES completion:nil];
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
