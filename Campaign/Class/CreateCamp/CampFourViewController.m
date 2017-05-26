//
//  CampFourViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "CampFourViewController.h"

@interface CampFourViewController ()

@property (weak,nonatomic) IBOutlet UITextField         *price;

@end

@implementation CampFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_price becomeFirstResponder];
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

- (IBAction)btnNext:(id)sender
{
    if ([[self.price text] length] == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Ludi Notice!" message:@"Please Input Prize" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        [self.price becomeFirstResponder];
        return;
    }
    else
    {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *one = [board instantiateViewControllerWithIdentifier:@"campLast"];
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
