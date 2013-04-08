//
//  AuthViewController.m
//  SimpleSample-chat_users-v2-ios
//
//  Created by Glebus on 04.04.13.
//  Copyright (c) 2013 Quickblox. All rights reserved.
//

#import "AuthViewController.h"
#import "DataManager.h"

@interface AuthViewController ()
- (IBAction)connectWithFacebookClicked:(id)sender;
- (IBAction)connectWithTwitter:(id)sender;
@end

@implementation AuthViewController {
    
}


#pragma mark -
#pragma mark View LifeCycle

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


#pragma mark -
#pragma mark UI

- (IBAction)connectWithFacebookClicked:(id)sender {
    [self loginWithFacebook];
}

- (IBAction)connectWithTwitter:(id)sender {
    [self loginWithTwitter];
}


#pragma mark -
#pragma mark QBActionStatusDelegate

- (void)completedWithResult:(Result *)result {
    if([result isKindOfClass:[QBAAuthSessionCreationResult class]]){
        [[DataManager manager] setIsAuth:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark -
#pragma mark Helper

- (void)loginWithFacebook {
    QBASessionCreationRequest *request = [QBASessionCreationRequest new];
    request.socialProvider = @"facebook";
    [QBAuth createSessionWithExtendedRequest:request delegate:self];
}

- (void)loginWithTwitter {
    QBASessionCreationRequest *request = [QBASessionCreationRequest new];
    request.socialProvider = @"twitter";
    [QBAuth createSessionWithExtendedRequest:request delegate:self];
}

@end
