//
//  HomeViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "HomeDetailViewController.h"
#import "CampOneViewController.h"
#import "CampData.h"

@interface HomeViewController () <UISearchBarDelegate>
{
    NSArray *searchResults;
    NSArray *totalArray;
    BOOL termsChecked;
}

@property (weak,nonatomic) IBOutlet UITableView         *homeTableView;
@property (weak,nonatomic) IBOutlet UILabel             *titleLbl;
@property (weak, nonatomic) IBOutlet UISearchBar        *searchBar2;
@property (nonatomic, assign) bool                      isFiltered;

@property int selIndex;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar2.hidden = YES;
    
    _popView.alpha = 0.0;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAlert) name:@"showAlert" object:nil];
    
    [[UITextField appearanceWhenContainedIn:[_searchBar2 class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    [[UILabel appearanceWhenContainedIn:[_searchBar2 class], nil] setTextColor:[UIColor darkGrayColor]];
    _searchBar2.delegate = (id)self;
    
    [self getData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData
{
    CampData *data1 = [CampData new];
    data1.userPhoto = @"user0.jpg";
    data1.campName = @"Best Basketball";
    data1.campDes = @"Get recognized by Nike by submitting your best dunks";
    data1.subCount = @"1400";
    data1.postDate = @"1d 10h";
    data1.userName = @"Olesya Bob";
    
    CampData *data2 = [CampData new];
    data2.userPhoto = @"user1.jpg";
    data2.campName = @"Best Golf";
    data2.campDes = @"Get recognized by Nike by submitting your best dunks";
    data2.subCount = @"1740";
    data2.postDate = @"2d 3h";
    data2.userName = @"Stefania Marina";
    
    CampData *data3 = [CampData new];
    data3.userPhoto = @"user2.jpg";
    data3.campName = @"Best Baseball";
    data3.campDes = @"Get recognized by Nike by submitting your best dunks";
    data3.subCount = @"1200";
    data3.postDate = @"2d 8h";
    data3.userName = @"Cesla Amarelle";
    
    CampData *data4 = [CampData new];
    data4.userPhoto = @"user3.jpg";
    data4.campName = @"Best Basketball";
    data4.campDes = @"Get recognized by Nike by submitting your best dunks";
    data4.subCount = @"758";
    data4.postDate = @"3d 2h";
    data4.userName = @"Denis Obuz";
    
    CampData *data5 = [CampData new];
    data5.userPhoto = @"user4.jpg";
    data5.campName = @"Best Baseball";
    data5.campDes = @"Get recognized by Nike by submitting your best dunks";
    data5.subCount = @"1400";
    data5.postDate = @"3d 4h";
    data5.userName = @"Samuel Noodlez";
    
    CampData *data6 = [CampData new];
    data6.userPhoto = @"user5.jpg";
    data6.campName = @"Best Football";
    data6.campDes = @"Get recognized by Nike by submitting your best dunks";
    data6.subCount = @"1475";
    data6.postDate = @"3d 7h";
    data6.userName = @"Doris Muller";
    
    CampData *data7 = [CampData new];
    data7.userPhoto = @"user6.jpg";
    data7.campName = @"Best Football";
    data7.campDes = @"Get recognized by Nike by submitting your best dunks";
    data7.subCount = @"1850";
    data7.postDate = @"3d 11h";
    data7.userName = @"Alex Capus";
    
    totalArray = [NSArray arrayWithObjects:data1, data2, data3,data4,data5,data6,data7,nil];

}

- (IBAction)btnShowSearch:(id)sender
{
    termsChecked = !termsChecked;
    if (termsChecked) {
        self.searchBar2.hidden = NO;
        self.titleLbl.hidden = YES;
    }
    else
    {
        self.searchBar2.hidden = YES;
        self.titleLbl.hidden = NO;
    }

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    int total = 6;
    UITabBarItem *item = self.tabBarController.tabBar.items[0];
    item.badgeValue = (total == 0) ? nil : [NSString stringWithFormat:@"%d", total];
}


- (IBAction)btnSubmission:(id)sender
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CampOneViewController *one = [board instantiateViewControllerWithIdentifier:@"cameraVC"];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:one];
    nc.navigationBar.hidden = YES;
    _popView.alpha = 0.0;
    [self.navigationController presentModalViewController:nc animated:YES];

}

- (IBAction)btnCreate:(id)sender
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CampOneViewController *one = [board instantiateViewControllerWithIdentifier:@"oneVC"];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:one];
    nc.navigationBar.hidden = YES;
    _popView.alpha = 0.0;
    [self.navigationController presentModalViewController:nc animated:YES];
}

#pragma makr - Table View Data Source

- (NSInteger)numberofSectionInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rowCount;
    if(self.isFiltered)
        rowCount = searchResults.count;
    else
        rowCount = totalArray.count;
    
    return rowCount;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HomeViewCell";
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
        cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    
    CampData *campData = nil;

    if(_isFiltered)
    {
        campData = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        campData = [totalArray objectAtIndex:indexPath.row];
    }

    cell.sport.text = campData.campName;
    cell.names.text = campData.userName;
    cell.des.text = campData.campDes;
    cell.date.text = campData.postDate;
    cell.thumbImg.image = [UIImage imageNamed:campData.userPhoto];
    cell.subCount.text = [NSString stringWithFormat:@"%@ Submissions",campData.subCount];
    
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selIndex = indexPath.row;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeDetailViewController    *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    //NSLog(@"searchBar ... text.length: %d", text.length);
    self.homeTableView.hidden = NO;
    if(text.length == 0)
    {
        _isFiltered = FALSE;
        [searchBar resignFirstResponder];
    }
    else
    {
        _isFiltered = true;
        
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"userName contains[c] %@", text];
        searchResults = [totalArray filteredArrayUsingPredicate:resultPredicate];
        
    }//end if-else
    
    [self.homeTableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //User hit Search button on Keyboard
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    _isFiltered = FALSE;
    [self.homeTableView reloadData];
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
