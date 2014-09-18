//
//  PGSideDrawerController.m
// SideDrawerExample
//
//  Created by Pulkit Goyal on 18/09/14.
//  Copyright (c) 2014 Pulkit Goyal. All rights reserved.
//

#import "PGSideDrawerController.h"
#import "UIViewController+MMDrawerController.h"

@interface PGSideDrawerController ()

@property(nonatomic) int currentIndex;
@end

@implementation PGSideDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.currentIndex = 0;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentIndex == indexPath.row) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        return;
    }

    UIViewController *centerViewController;
    switch (indexPath.row) {
        case 0:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FIRST_TOP_VIEW_CONTROLLER"];
            break;
        case 1:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SECOND_TOP_VIEW_CONTROLLER"];
            break;
        default:
            break;
    }

    if (centerViewController) {
        self.currentIndex = indexPath.row;
        [self.mm_drawerController setCenterViewController:centerViewController withCloseAnimation:YES completion:nil];
    } else {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }
}

@end
