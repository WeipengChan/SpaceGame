//
//  ViewController.m
//  SpaceGame_UseUIEffect
//
//  Created by mac on 14-1-4.
//  Copyright (c) 2014年 YunInfo. All rights reserved.
//

#import "ViewController.h"
#import "UIEffectDesignerView.h"

@interface ViewController ()
@property(strong,nonatomic)     UIEffectDesignerView * myfireEffectView;
@property(strong,nonatomic)    UIEffectDesignerView * starsEffectView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myfireEffectView = [UIEffectDesignerView effectWithFile:@"myBoosterfire.ped"];
    self.starsEffectView  = [UIEffectDesignerView effectWithFile:@"myStars.ped"];
    
    [self.view addSubview:self.myfireEffectView];
    self.myfireEffectView.center = CGPointMake(55,self.view.frame.size.height/2 );
    
    //制造形变
    self.myfireEffectView.transform =  CGAffineTransformMakeScale(0.67, 0.67);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controllRelease:(id)sender {
}

- (IBAction)controllPressesd:(id)sender {
}

- (IBAction)boostRelease:(id)sender {
}

- (IBAction)boostPressed:(id)sender {
}
@end
