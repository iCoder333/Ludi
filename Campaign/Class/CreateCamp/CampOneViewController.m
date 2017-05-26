//
//  CampOneViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "CampOneViewController.h"

@interface CampOneViewController ()

@property (weak,nonatomic) IBOutlet UITextField         *name;

@end

@implementation CampOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_name becomeFirstResponder];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNext:(id)sender
{
    if ([[self.name text] length] == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Ludi Notice!" message:@"Please Input Campaign Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        [self.name becomeFirstResponder];
        return;
    }
    else
    {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *one = [board instantiateViewControllerWithIdentifier:@"campTwo"];
        [self.navigationController pushViewController:one animated:YES];
    }

}



- (IBAction)btnBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
