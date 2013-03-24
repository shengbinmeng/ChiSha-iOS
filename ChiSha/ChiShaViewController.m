//
//  ChiShaViewController.m
//  ChiSha
//
//  Created by Shengbin Meng on 13-2-27.
//  Copyright (c) 2013年 Peking University. All rights reserved.
//

#import "ChiShaViewController.h"
#import "ChoiceListViewController.h"
#import <AudioToolbox/AudioServices.h>
#import "ChiShaChoiceManager.h"

@interface ChiShaViewController ()

@end

@implementation ChiShaViewController {
    NSMutableArray* choices;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"吃啥";
    }
    return self;
}

- (void) barButtonPressed
{
    ChoiceListViewController *vc = [[ChoiceListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"有啥" style:UIBarButtonItemStyleBordered target:self action:@selector(barButtonPressed)];
    self.navigationItem.rightBarButtonItem = button;
}

- (void) viewWillAppear:(BOOL)animated {
    choices = [ChiShaChoiceManager getChoiceList];

    [self.conformButton setHidden:YES];
    [self.labelAbove setText:@"~~摇一摇~~"];
    [self.labelBelow setText:@"来决定吃啥"];
    [self.labelLarge setText:@""];
}

- (BOOL) canBecomeFirstResponder
{    
    return YES;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.subtype == UIEventSubtypeMotionShake) {
        // Code at shake event
        [self decideWhat:nil];
        //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        AudioServicesPlaySystemSound(1007);

    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)decideWhat:(id)sender {
    
    NSDictionary *choice = [choices objectAtIndex: (arc4random() % choices.count)];
    
    [self.labelAbove setText:@""];
    [self.labelBelow setText:@"虽然还能再摇，但要忠于第一次哦"];
    [self.labelLarge setText:[choice objectForKey:@"name"]];
    [self.conformButton setHidden:NO];
}

- (IBAction)conformThat:(id)sender {
    [self.labelBelow setText:@"不错的地方，去吧"];
    [self.conformButton setHidden:YES];
}

- (void)viewDidUnload {
    [self setDecideButton:nil];
    [self setLabelAbove:nil];
    [self setLabelBelow:nil];
    [self setLabelLarge:nil];
    [self setConformButton:nil];
    [super viewDidUnload];
}
@end
