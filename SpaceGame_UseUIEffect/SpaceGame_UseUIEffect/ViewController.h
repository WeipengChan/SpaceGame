//
//  ViewController.h
//  SpaceGame_UseUIEffect
//
//  Created by mac on 14-1-4.
//  Copyright (c) 2014年 YunInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *rocketImg;

- (IBAction)controllRelease:(id)sender;
- (IBAction)controllPressesd:(id)sender;

- (IBAction)boostRelease:(id)sender;
- (IBAction)boostPressed:(id)sender;
@end
