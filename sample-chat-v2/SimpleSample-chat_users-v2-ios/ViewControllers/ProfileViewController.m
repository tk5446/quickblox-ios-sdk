//
//  ProfileViewController.m
//  SimpleSample-chat_users-v2-ios
//
//  Created by Glebus on 04.04.13.
//  Copyright (c) 2013 Quickblox. All rights reserved.
//

#import "ProfileViewController.h"
#import "TabBarViewController.h"
#import "DataManager.h"

@interface ProfileViewController ()
- (IBAction)logoutClicked:(id)sender;
@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutClicked:(id)sender {
    [QBUsers logOutWithDelegate:self];
}

- (void)completedWithResult:(Result *)result {
    if ([result isKindOfClass:[QBUUserLogOutResult class]]) {
        [[DataManager manager] setCurrentUser:nil];
        [((TabBarViewController *)self.tabBarController) checkAuth];
    }
}

@end
