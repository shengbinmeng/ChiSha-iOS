//
//  ChiShaViewController.h
//  ChiSha
//
//  Created by Shengbin Meng on 13-2-27.
//  Copyright (c) 2013年 Peking University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChiShaViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet UIButton *decideButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *conformButton;

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *labelAbove;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *labelBelow;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *labelLarge;

- (IBAction)decideWhat:(id)sender;
- (IBAction)conformThat:(id)sender;

@end
