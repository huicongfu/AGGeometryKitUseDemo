//
//  AGKUseViewController.m
//  AGGeometryKitUseDemo
//
//  Created by shouzhi on 2018/3/29.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "AGKUseViewController.h"
#import "AGGeometryKit.h"

@interface AGKUseViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *tlControl;
@property (weak, nonatomic) IBOutlet UIView *trControl;
@property (weak, nonatomic) IBOutlet UIView *brControl;
@property (weak, nonatomic) IBOutlet UIView *blControl;
@property (weak, nonatomic) IBOutlet UIView *targetView;

@property (nonatomic, retain) UIPinchGestureRecognizer * pinchRecognizer;
@property (nonatomic, retain) UIRotationGestureRecognizer * rotationRecognizer;
@property (nonatomic, retain) UIPanGestureRecognizer * panRecognizer;

@property (nonatomic, assign) AGKQuad initialQuad;
@property (nonatomic, assign) CGPoint initialTouchLocation;

@property (nonatomic, assign) CGFloat lastScale;
@property (nonatomic, assign) CGFloat lastRotation;
@property (nonatomic, assign) CGPoint lastTranslation;



@end

@implementation AGKUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialData];
}

- (void)initialData {
    self.lastScale = 1.0;
    self.lastRotation = 0.0;
    self.lastTranslation = CGPointZero;
    
    [self.targetView.layer ensureAnchorPointIsSetToZero];
    
    AGKQuad quad = self.targetView.layer.quadrilateral;
    self.targetView.center = CGPointZero;
    self.targetView.layer.quadrilateral = quad;
    
    self.pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    self.pinchRecognizer.delegate = self;
    [self.targetView addGestureRecognizer:self.pinchRecognizer];
    
    self.rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    self.rotationRecognizer.delegate = self;
    [self.targetView addGestureRecognizer:self.rotationRecognizer];
    
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.panRecognizer.delegate = self;
    [self.targetView addGestureRecognizer:self.panRecognizer];
    
    [self.tlControl addGestureRecognizer:[self getPanchRecognizer]];
    [self.trControl addGestureRecognizer:[self getPanchRecognizer]];
    [self.brControl addGestureRecognizer:[self getPanchRecognizer]];
    [self.blControl addGestureRecognizer:[self getPanchRecognizer]];
}

- (UIPanGestureRecognizer *)getPanchRecognizer {
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanInFourControlPoint:)];
    pan.delegate = self;
    return pan;
}

- (void)handlePanInFourControlPoint:(UIPanGestureRecognizer *)recognizer {
    
    UIView * controlView = [recognizer view];
    CGPoint cPoint = [recognizer translationInView:self.view];
    controlView.centerX += cPoint.x;
    controlView.centerY += cPoint.y;
    
    [recognizer setTranslation:CGPointZero inView:self.view];
    
    [self updateQuadrilateralByControlPoints];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    NSLog(@"1%s",__func__);
    [self handleRecognizers:recognizer];
}

- (void)handleRotation:(UIRotationGestureRecognizer *)recognizer {
    NSLog(@"2%s",__func__);
    [self handleRecognizers:recognizer];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    NSLog(@"3%s",__func__);
    [self handleRecognizers:recognizer];
}

- (void)handleRecognizers:(UIGestureRecognizer *)rcongnizer {
    
}

- (void)updateQuadrilateralByControlPoints {
    AGKQuad quad = AGKQuadMake(self.tlControl.center, self.trControl.center, self.brControl.center, self.blControl.center);
    self.targetView.layer.quadrilateral = quad;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
