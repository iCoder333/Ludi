//
//  SubOneViewController.h
//  Campaign
//
//  Created by Florin on 5/23/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZFormSheetPresentationContentSizing.h"

@interface SubOneViewController : UIViewController <MZFormSheetPresentationContentSizing>
{
    BOOL termsChecked;
    NSArray *searchResults;
    NSArray *totalArray;
}

@property (weak,nonatomic) IBOutlet UITableView         *subOneTableView;
@property (weak,nonatomic) IBOutlet UILabel             *titleLbl;
@property (weak, nonatomic) IBOutlet UISearchBar        *searchBar;
@property (nonatomic, assign) bool                      isFiltered;

@property int selIndex;

@end
