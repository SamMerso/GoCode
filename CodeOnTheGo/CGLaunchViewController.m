//
//  CGLaunchViewController.m
//  CodeOnTheGo
//
//  Created by Tosin Afolabi on 22/02/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "CGLaunchViewController.h"
#import "CGProfileViewController.h"
#import "CGLandscapeViewController.h"
#import "CGTableViewController.h"
#import "CGLessonViewController.h"
#import "CGChallengeViewController.h"

@interface CGLaunchViewController ()

@end

@implementation CGLaunchViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissProfileView) name:@"dismissProfileView" object:nil];

    CGSize screenSize = self.view.bounds.size;
    UIColor *blueColor = [UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1];

    UILabel *logo = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, screenSize.width, 150)];
    [logo setText:@"\uE800"];
    [logo setTextColor:blueColor];
    [logo setTextAlignment:NSTextAlignmentCenter];
    [logo setFont:[UIFont fontWithName:@"icons" size:70.0]];

    UILabel *appTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, screenSize.width, 100)];
    [appTitle setText:@"GO CODE"];
    [appTitle setTextColor:blueColor];
    [appTitle setTextAlignment:NSTextAlignmentCenter];
    [appTitle setFont:[UIFont fontWithName:@"Montserrat-Bold" size:30]];

    UIButton *learnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [learnButton setTitle:@"Learn Something New?" forState:UIControlStateNormal];
    [learnButton setBackgroundColor:blueColor];
    [[learnButton titleLabel] setFont:[UIFont fontWithName:@"Montserrat" size:15.0]];
    [learnButton setFrame:CGRectMake(50, 230, screenSize.width - 50, 50)];
    [learnButton addTarget:self action:@selector(showLessonView) forControlEvents:UIControlEventTouchUpInside];

    UIButton *challengeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [challengeButton setTitle:@"Challenge Yourself?" forState:UIControlStateNormal];
    [challengeButton setBackgroundColor:[UIColor colorWithRed:0.941 green:0.698 blue:0.282 alpha:1]];
    [[challengeButton titleLabel] setFont:[UIFont fontWithName:@"Montserrat" size:15.0]];
    [challengeButton setFrame:CGRectMake(50, 310, screenSize.width - 50, 50)];
    [challengeButton addTarget:self action:@selector(showChallengeView) forControlEvents:UIControlEventTouchUpInside];


    UIButton *playgroudButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playgroudButton setTitle:@"Experiment With JS?" forState:UIControlStateNormal];
    [playgroudButton setBackgroundColor:[UIColor colorWithRed:0.835 green:0.176 blue:0.196 alpha:1]];
    [[playgroudButton titleLabel] setFont:[UIFont fontWithName:@"Montserrat" size:15.0]];
    [playgroudButton setFrame:CGRectMake(50, 390, screenSize.width - 50, 50)];
    [playgroudButton addTarget:self action:@selector(showPlaygroundView) forControlEvents:UIControlEventTouchUpInside];

    UILabel *inspirationalQuote = [[UILabel alloc] initWithFrame:CGRectMake(20, 410, 280, 200)];
    [inspirationalQuote setText:@"The iOS Whatsapp Client has only 10,000 Lines of Code, yet it's worth $19 Billion. Don't you want in on that?"];
    [inspirationalQuote setNumberOfLines:4];
    [inspirationalQuote setTextAlignment:NSTextAlignmentCenter];
    [inspirationalQuote setFont:[UIFont fontWithName:@"Avenir-Light" size:12.0]];

    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [profileButton setFrame:CGRectMake(10, 30, 30, 30)];
    [profileButton setTitle:@"\uE809" forState:UIControlStateNormal];
    [profileButton.titleLabel setFont:[UIFont fontWithName:@"icons" size:25]];
    [profileButton setTitleColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1] forState:UIControlStateNormal];
    [profileButton addTarget:self action:@selector(pushProfile) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:logo];
    [self.view addSubview:appTitle];
    [self.view addSubview:learnButton];
    [self.view addSubview:challengeButton];
    [self.view addSubview:playgroudButton];
    [self.view addSubview:inspirationalQuote];
    [self.view addSubview:profileButton];
}

- (void)showChallengeView
{
    CGChallengeViewController *challengeViewController = [[CGChallengeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:challengeViewController animated:YES];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)showPlaygroundView
{
    CGLandscapeViewController *playground = [[CGLandscapeViewController alloc] init];
    [self.navigationController pushViewController:playground animated:YES];
}

- (void)dismissProfileView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showLessonView
{
    CGTableViewController *tableViewController = [[CGTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:tableViewController animated:YES];
}

- (void)pushProfile
{
    CGProfileViewController *profile = [[CGProfileViewController alloc] init];
    [self.navigationController pushViewController:profile animated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dismissProfileView" object:nil];
}


@end
