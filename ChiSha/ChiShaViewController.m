//
//  ChiShaViewController.m
//  ChiSha
//
//  Created by Shengbin Meng on 13-2-27.
//  Copyright (c) 2013年 Peking University. All rights reserved.
//

#import "ChiShaViewController.h"
#import "ChoiceListViewController.h"

@interface ChiShaViewController ()

@end

@implementation ChiShaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"吃啥";
    }
    return self;
}

- (void) buttonPressed
{
    ChoiceListViewController *vc = [[ChoiceListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"有啥" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonPressed)];
    self.navigationItem.rightBarButtonItem = button;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
