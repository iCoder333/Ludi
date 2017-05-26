//
//  ViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak,nonatomic) IBOutlet UIView          *loginView;
@property (weak,nonatomic) IBOutlet UITextField     *username;
@property (weak,nonatomic) IBOutlet UITextField     *pwd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginView.layer.cornerRadius = 4; // this value vary as per your desire
    self.loginView.clipsToBounds = YES;
    self.loginView.layer.borderColor = [UIColor grayColor].CGColor;
    self.loginView.layer.borderWidth = 1.0f;
    
    NSAttributedString *email = [[NSAttributedString alloc] initWithString:@"E-Mail" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.username.attributedPlaceholder = email;
    
    NSAttributedString *password = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }];
    self.pwd.attributedPlaceholder = password;

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
