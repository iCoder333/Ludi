//
//  SettingViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingViewCell.h"

@interface SettingViewController ()

@property (weak,nonatomic) IBOutlet UITableView         *settingTableView;
@property (strong,nonatomic) NSMutableArray             *dataArray;
@property (weak,nonatomic) IBOutlet UIView              *bottomView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _settingTableView.tableFooterView = self.bottomView;
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"Change Display Name",@"Change Password", @"Privacy", @"Terms of Service", nil];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberofSectionInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"SettingViewCell";
    SettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
        cell = [[SettingViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    cell.titleName.text = [_dataArray objectAtIndex:indexPath.row];
    
    return  cell;
    
}


- (IBAction)btnLogout:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
