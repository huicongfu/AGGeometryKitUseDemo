//
//  ViewController.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/1/30.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "ViewController.h"
#import "AGGeometryKit/AGGeometryKit.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIView *topLeftControl;
@property (nonatomic, strong) IBOutlet UIView *topRightControl;
@property (nonatomic, strong) IBOutlet UIView *bottomLeftControl;
@property (nonatomic, strong) IBOutlet UIView *bottomRightControl;

@property (nonatomic, strong) IBOutlet UIView *maskView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.imageView.layer ensureAnchorPointIsSetToZero];
    self.imageView.layer.quadrilateral = AGKQuadMake(self.topLeftControl.center, self.topRightControl.center, self.bottomRightControl.center, self.bottomLeftControl.center);
    
    [self createOverlay];
    [self updateOverlay];
    
}
- (IBAction)panGestureChanged:(UIPanGestureRecognizer *)sender {
    
    UIImageView * controlPointView = (UIImageView *)[sender view];
    controlPointView.highlighted = sender.state == UIGestureRecognizerStateChanged;
    
    CGPoint translation = [sender translationInView:self.view];
    controlPointView.centerX += translation.x;
    controlPointView.centerY += translation.y;
    [sender setTranslation:CGPointZero inView:self.view];
    
    self.imageView.layer.quadrilateral = AGKQuadMake(self.topLeftControl.center, self.topRightControl.center, self.bottomRightControl.center, self.bottomLeftControl.center);
    [self updateOverlay];
}

- (void)createOverlay {
    self.maskView = [[UIView alloc] init];
    self.maskView.center = self.imageView.center;
    self.maskView.layer.shadowColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5].CGColor;
    self.maskView.layer.shadowOpacity = 1.0;
    self.maskView.layer.shadowRadius = 0.0;
    self.maskView.layer.shadowOffset = CGSizeZero;
    self.maskView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    self.maskView.userInteractionEnabled = NO;
    [self.view insertSubview:self.maskView aboveSubview:self.imageView];
    
    
}

- (void)updateOverlay {
    
    UIColor *redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    UIColor *greenColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
    
    AGKQuad quad = AGKQuadMake(self.topLeftControl.center, self.topRightControl.center, self.bottomRightControl.center, self.bottomLeftControl.center);
    
    self.maskView.layer.position = CGPointZero;
    self.maskView.layer.shadowPath = [UIBezierPath bezierPathWithAGKQuad:quad].CGPath;
    self.maskView.layer.shadowColor = AGKQuadIsConvex(quad) ? greenColor.CGColor : redColor.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
