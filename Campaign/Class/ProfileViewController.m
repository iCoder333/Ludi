//
//  ProfileViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileViewCell.h"
#import "ProfileCollectionCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    BOOL termsChecked;
}
@property (weak,nonatomic) IBOutlet UITableView         *profileTableView;
@property (weak,nonatomic)IBOutlet UICollectionView     *submitCollectionView;
@property (weak,nonatomic) IBOutlet UIView              *headView;
@property (weak,nonatomic) IBOutlet UIImageView         *userImg;
@property (weak,nonatomic) IBOutlet UILabel             *userName;
@property (weak,nonatomic) IBOutlet UILabel             *cam_Count;
@property (weak,nonatomic) IBOutlet UISegmentedControl  *selSwitch;
@property (weak,nonatomic) IBOutlet UIButton            *btnFollow;

@property (strong, nonatomic) IBOutlet UIPageControl    *pageControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnFollow.layer.borderColor = [[UIColor alloc] initWithRed:41.0f/255.0 green:144.0f/255.0 blue:234.0f/255.0 alpha:1].CGColor;
    self.btnFollow.layer.borderWidth = 1.0f;
    self.btnFollow.backgroundColor = [UIColor whiteColor];
    [self.btnFollow setTitleColor:[[UIColor alloc] initWithRed:41.0f/255.0 green:144.0f/255.0 blue:234.0f/255.0 alpha:1] forState:UIControlStateNormal];
    [self.btnFollow setTitle:@"Follow" forState:UIControlStateNormal];
    self.btnFollow.layer.cornerRadius = 4; // this value vary as per your desire
    self.btnFollow.clipsToBounds = YES;
    
    self.profileTableView.alpha = 1.0;
    self.submitCollectionView.alpha = 0.0;
    
    self.userImg.layer.cornerRadius = self.userImg.frame.size.height / 2;
    self.userImg.layer.masksToBounds = YES;
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser
{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        self.pageControl.currentPage -=1;
        self.selSwitch.selectedSegmentIndex = 0;
        self.profileTableView.alpha = 1.0;
        self.submitCollectionView.alpha = 0.0;
    }
    else if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionRight)
    {
        self.pageControl.currentPage +=1;
        self.selSwitch.selectedSegmentIndex = 1;
        self.profileTableView.alpha = 0.0;
        self.submitCollectionView.alpha = 1.0;
    }
}

-(IBAction)SegmentChangeViewValueChanged:(UISegmentedControl *)SControl
{
    if (SControl.selectedSegmentIndex==0)
    {
        self.pageControl.currentPage -=1;
        self.profileTableView.alpha = 1.0;
        self.submitCollectionView.alpha = 0.0;
    }
    else if (SControl.selectedSegmentIndex==1)
    {
        self.pageControl.currentPage +=1;
        self.profileTableView.alpha = 0.0;
        self.submitCollectionView.alpha = 1.0;

    }
    
}

- (IBAction)btnRemember:(id)sender;
{
    termsChecked = !termsChecked;
    if (termsChecked) {
        self.btnFollow.layer.borderColor = (__bridge CGColorRef _Nullable)([[UIColor alloc] initWithRed:41.0f/255.0 green:144.0f/255.0 blue:234.0f/255.0 alpha:1]);
        self.btnFollow.backgroundColor = [[UIColor alloc] initWithRed:41.0f/255.0 green:144.0f/255.0 blue:234.0f/255.0 alpha:1];
        [self.btnFollow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.btnFollow setTitle:@"Following" forState:UIControlStateNormal];

        
    }
    else
    {
        self.btnFollow.layer.borderColor = [[UIColor alloc] initWithRed:41.0f/255.0 green:144.0f/255.0 blue:234.0f/255.0 alpha:1].CGColor;
        self.btnFollow.backgroundColor = [UIColor whiteColor];
        [self.btnFollow setTitleColor:[[UIColor alloc] initWithRed:41.0f/255.0 green:144.0f/255.0 blue:234.0f/255.0 alpha:1] forState:UIControlStateNormal];
        [self.btnFollow setTitle:@"Follow" forState:UIControlStateNormal];
        self.btnFollow.layer.cornerRadius = 4; // this value vary as per your desire
        self.btnFollow.clipsToBounds = YES;

    }
}


- (NSInteger)numberofSectionInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ProfileViewCell";
    ProfileViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
        cell = [[ProfileViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    
    
    return  cell;
    
}

#pragma mark - CollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ProfileCollectionCell";
    
    ProfileCollectionCell *cell = (ProfileCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController    *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
 
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
