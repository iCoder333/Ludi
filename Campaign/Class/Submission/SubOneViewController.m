//
//  SubOneViewController.m
//  Campaign
//
//  Created by Florin on 5/23/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "SubOneViewController.h"
#import "MZFormSheetPresentationController.h"
#import "SubOnePageCell.h"
#import "CampData.h"

@implementation SubOneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.hidden = YES;
    self.titleLbl.hidden = NO;
    
    [self getData];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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
        self.searchBar.hidden = NO;
        self.titleLbl.hidden = YES;
    }
    else
    {
        self.searchBar.hidden = YES;
        self.titleLbl.hidden = NO;
    }
    
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
    static NSString *identifier = @"SubOnePageCell";
    SubOnePageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
        cell = [[SubOnePageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    
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
    cell.date.text = campData.postDate;
    cell.thumbImg.image = [UIImage imageNamed:campData.userPhoto];

    
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController    *vc = [storyboard instantiateViewControllerWithIdentifier:@"subTwoVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    //NSLog(@"searchBar ... text.length: %d", text.length);
    self.subOneTableView.hidden = NO;
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
    
    [self.subOneTableView reloadData];
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
    [self.subOneTableView reloadData];
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)shouldUseContentViewFrameForPresentationController:(MZFormSheetPresentationController *)presentationController {
    return YES;
}
- (CGRect)contentViewFrameForPresentationController:(MZFormSheetPresentationController *)presentationController currentFrame:(CGRect)currentFrame {
    currentFrame.size.height = 480;//GTA
    currentFrame.size.width = 350;
    return currentFrame;
}

@end
