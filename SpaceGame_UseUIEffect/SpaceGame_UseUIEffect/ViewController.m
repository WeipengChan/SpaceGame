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

@property(strong,nonatomic)    UIColor *   boosterOriginalColor;
@property(assign,nonatomic)    CGPoint     boostingRocketCenter ;
@property(assign,nonatomic)    CGPoint     originalRocketCenter ;
@property(assign,nonatomic)    BOOL        isMoving;
@property(assign,nonatomic)    int         xMovingDelta,yMovingDelta;
@end

@implementation ViewController

- (void)loadTheFireEffectView
{    [self.myfireEffectView removeFromSuperview];
    self.rocketImg.clipsToBounds = NO;
    self.myfireEffectView = [UIEffectDesignerView effectWithFile:@"myBoosterfire.ped"];
    [self.rocketImg addSubview:self.myfireEffectView];
    self.myfireEffectView.center = CGPointMake(25, 50);
    //制造形变
    self.myfireEffectView.transform =  CGAffineTransformMakeScale(0.67, 0.67);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
 
    self.starsEffectView  = [UIEffectDesignerView effectWithFile:@"myStars.ped"];
    
    [self loadTheFireEffectView];
    

    [self.view insertSubview:self.starsEffectView belowSubview:self.rocketImg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controllRelease:(UIButton*)sender
{
    
    self.isMoving = NO;
    
    if (sender.tag==1) _xMovingDelta = 0;
    if (sender.tag==2) _xMovingDelta = 0;
    if (sender.tag==3) _yMovingDelta = 0;
    if (sender.tag==4) _yMovingDelta = 0;
    
}

- (IBAction)controllPressesd:(UIButton*)sender
{
    //set the flag to "moving"
    self.isMoving = YES;
    
    //adjust the direction according to the button's tag
    if (sender.tag==1) _xMovingDelta = -4;
    if (sender.tag==2) _xMovingDelta = 4;
    if (sender.tag==3) _yMovingDelta = -4;
    if (sender.tag==4) _yMovingDelta = 4;
    
    //start the tick function to move the ship around
    [self tick];
    
}

-(void)tick
{
    self.rocketImg.center = CGPointMake(self.rocketImg.center.x+_yMovingDelta, self.rocketImg.center.y+_xMovingDelta);
    
   
    
    if (self.isMoving) {
        [self performSelector:@selector(tick) withObject:nil afterDelay:0.02];
    }
}
- (IBAction)boostRelease:(id)sender {
    
   
    [UIView animateWithDuration:0.25 animations:^{
        self.rocketImg.center = _originalRocketCenter;
        //slow down the stars to normal speed
        [self.myfireEffectView.emitter setValue:@150 forKeyPath:@"emitterCells.cell.velocity"];
        [self.myfireEffectView.emitter setValue:@0 forKeyPath:@"emitterCells.cell.xAcceleration"];
        
        //change flame to original color and size
        [self.myfireEffectView.emitter setValue:(id)self.boosterOriginalColor.CGColor forKeyPath:@"emitterCells.cell.color"];
        [self.myfireEffectView.emitter setValue:@1 forKeyPath:@"emitterCells.cell.scale"];
        
    }];
    
   
 
   
}

- (IBAction)boostPressed:(id)sender
{
    [self.myfireEffectView.emitter setValue:@750 forKeyPath:@"emitterCells.cell.velocity"];
    [self.myfireEffectView.emitter setValue:@-750 forKeyPath:@"emitterCells.cell.xAcceleration"];
    
    //show the raging fire trail
    self.boosterOriginalColor = [UIColor colorWithCGColor:(CGColorRef)[self.myfireEffectView.emitter valueForKeyPath:@"emitterCells.cell.color"]];
    [self.myfireEffectView.emitter setValue:(id)[UIColor orangeColor].CGColor forKeyPath:@"emitterCells.cell.color"];
    [self.myfireEffectView.emitter setValue:@3 forKeyPath:@"emitterCells.cell.scale"];
    
    
    //move the rocket
    _boostingRocketCenter = CGPointMake(self.rocketImg.center.x+60, self.rocketImg.center.y);
    _originalRocketCenter = self.rocketImg.center;
    [UIView animateWithDuration:0.25 animations:^{
        self.rocketImg.center = _boostingRocketCenter;
    }];
}
@end
