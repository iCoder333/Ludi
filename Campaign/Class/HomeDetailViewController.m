//
//  HomeDetailViewController.m
//  Campaign
//
//  Created by Florin on 5/8/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "HomeHeadViewCell.h"
#import "HomeVideoViewCell.h"

@interface HomeDetailViewController () <UITableViewDataSource, UITableViewDelegate>
{
    BOOL termsChecked;
}

@property (weak, nonatomic) IBOutlet UITableView            *homeDetailTableView;
@property (weak, nonatomic) IBOutlet UILabel                *sportName;
@property (weak, nonatomic) IBOutlet UILabel                *userName;
@property (weak, nonatomic) IBOutlet UILabel                *subCount;
@property (weak, nonatomic) IBOutlet UILabel                *des;
@property (strong, nonatomic) NSMutableArray                 *checkArray;

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _checkArray = [[NSMutableArray alloc] init];
    
    [_checkArray removeAllObjects];
    
    for (int i = 0; i< 1; i++) {
        [_checkArray addObject:@"NO"];
    }

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    
    if (indexPath.section == 0) {
        height = 237;
    }
    else if (indexPath.section == 1) {
        height = 348;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        HomeHeadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeHeadViewCell"];
        
        if(cell == nil){
            cell = [HomeHeadViewCell homeHeadViewCell];
        }
        return cell;
    }
    else
    {
        HomeVideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeVideoViewCell"];
        
        if(cell == nil){
            cell = [HomeVideoViewCell homeVideoViewCell];
            cell.play = [[HcdCacheVideoPlayer alloc]init];
            // UIView *videoView = [[UIView alloc]initWithFrame:CGRectMake(26, 109, cell.frame.size.width-55, 170)];
            // [cell addSubview:videoView];
            
            if (![[_checkArray objectAtIndex:indexPath.row] isEqualToString:@"NO"]) {
                
                [cell.btnLike setBackgroundImage:[UIImage imageNamed:@"Heart"]
                                          forState:UIControlStateNormal];
                
                
            }
            else{
                [cell.btnLike setBackgroundImage:[UIImage imageNamed:@"Heart"]
                                          forState:UIControlStateNormal];
                
            }

            
            [cell.play playWithUrl:[NSURL URLWithString:@"http://techslides.com/demos/sample-videos/small.mp4"]
                      showView:cell.videoView
                  andSuperView:self.view
                     withCache:YES];
            
            NSLog(@"%f", [HcdCacheVideoPlayer allVideoCacheSize]);
            
            cell.btnLike.tag = indexPath.row;
            [cell.btnLike addTarget:self action:@selector(likePressed:) forControlEvents:UIControlEventTouchUpInside];


            
        }
        return cell;
    }
    return 0;
}


-(void)likePressed:(id)sender
{
    UIButton *btn = (UIButton* )sender;
    
    if ([[_checkArray objectAtIndex:btn.tag] isEqualToString:@"NO"]) {
        [_checkArray removeObjectAtIndex:btn.tag];
        [_checkArray insertObject:@"YES" atIndex:btn.tag];
        
    }
    else{
        [_checkArray removeObjectAtIndex:btn.tag];
        [_checkArray insertObject:@"NO" atIndex:btn.tag];
    }
    
    [_homeDetailTableView reloadData];

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
