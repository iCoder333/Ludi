//
//  ResetViewController.m
//  Campaign
//
//  Created by Florin on 5/20/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "ResetViewController.h"

@implementation ResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAttributedString *email = [[NSAttributedString alloc] initWithString:@"E-Mail" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.email.attributedPlaceholder = email;

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
