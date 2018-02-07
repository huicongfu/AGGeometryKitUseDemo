//
//  FourVC.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/1/31.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "FourVC.h"

@interface FourVC ()

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@end

@implementation FourVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.myImageView.hidden = YES;
//    [self createUI];
//    [self createReflectionView];
//    [self testAnchorPoint];
    [self createReflectionView2];
}

- (void)createRfelectionView3 {
    UIImage * gledeImage = [UIImage imageNamed:@"sample_image6"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [[self view] layer].borderColor = [UIColor blueColor].CGColor;
    [[self view] layer].borderWidth = 2;
    
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    [layer setContentsScale:[[UIScreen mainScreen] scale] ];
    
    [layer setBounds:CGRectMake(0, 0, gledeImage.size.width, gledeImage.size.height * 1.5)];
    layer.masksToBounds =  YES;
    layer.anchorPoint = CGPointMake(0.5, 0.0);
    layer.position = CGPointMake(self.view.frame.size.width/2, 10.0);
    layer.borderColor = [UIColor redColor].CGColor;
    layer.borderWidth = 0;
    
    layer.instanceCount = 2;
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DScale(transform, 1.0, -1.0, 1.0);
    transform = CATransform3DTranslate(transform, 0, -[gledeImage size].height * 2, 1.0);
    
    layer.instanceTransform = transform;
    
    CALayer * imageLayer = [CALayer layer];
    [imageLayer setContentsScale:[[UIScreen mainScreen] scale]];
    [imageLayer setContents:(__bridge id)gledeImage.CGImage];
    [imageLayer setBounds:CGRectMake(0.0, 0.0, [gledeImage size].width, [gledeImage size].height)];
    [imageLayer setAnchorPoint:CGPointMake(0, 0)];
    
    [layer addSublayer:imageLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setColors:[NSArray arrayWithObjects:(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor, [UIColor whiteColor].CGColor, nil]];
    
    [gradientLayer setBounds:CGRectMake(0, 0, layer.frame.size.width, [gledeImage size].height * 0.5 + 1.0)];
    [gradientLayer setAnchorPoint:CGPointMake(0.5, 0)];
    [gradientLayer setPosition:CGPointMake(self.view.frame.size.width/2, gledeImage.size.height + 10.0)];
    [gradientLayer setZPosition:1];
    
    [gradientLayer setContentsScale:[[UIScreen mainScreen] scale]];
    
    [[[self view] layer] addSublayer:layer];
    [[[self view] layer] addSublayer:gradientLayer];
}

- (void)createReflectionView2 {
    
    UIImage * gledeImage = [UIImage imageNamed:@"sample_image6"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.view.layer.borderColor = [UIColor blueColor].CGColor;
    self.view.layer.borderWidth = 2;
    
    CAReplicatorLayer * layer = [CAReplicatorLayer layer];
    [layer setContentsScale:[UIScreen mainScreen].scale];
    
    [layer setBounds:CGRectMake(0, 0, gledeImage.size.width, gledeImage.size.height*1.5)];
    layer.masksToBounds = YES;
    layer.anchorPoint = CGPointMake(0.5, 0.0);
    layer.position = CGPointMake(self.view.frame.size.width/2, 10.0);
    layer.borderColor = [UIColor redColor].CGColor;
    layer.borderWidth = 0;
    
    layer.instanceCount = 2;
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DScale(transform, 1.0, -1.0, 1.0);
    transform = CATransform3DTranslate(transform, 0, -[gledeImage size].height * 2, 1.0);
    
    layer.instanceTransform = transform;
    
    CALayer * imageLayer = [CALayer layer];
    [imageLayer setContentsScale:[UIScreen mainScreen].scale];
    imageLayer.contents = (__bridge id _Nullable)(gledeImage.CGImage);
    imageLayer.bounds = CGRectMake(0, 0, gledeImage.size.width, gledeImage.size.height);
    imageLayer.anchorPoint = CGPointMake(0, 0);
    
    [layer addSublayer:imageLayer];
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = [NSArray arrayWithObjects:(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor, [UIColor whiteColor].CGColor, nil];
    
    gradientLayer.bounds = CGRectMake(0, 0, layer.frame.size.width, gledeImage.size.height * 0.5 + 1.0);
    gradientLayer.anchorPoint = CGPointMake(0.5, 0);
    [gradientLayer setPosition:CGPointMake(self.view.frame.size.width/2, gledeImage.size.height + 10.0)];
    [gradientLayer setZPosition:1];
    
    gradientLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:gradientLayer];
    
}

- (void)testAnchorPoint {
    
    CALayer * myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    myLayer.position = CGPointMake(100, 100);
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    myLayer.anchorPoint = CGPointMake(0, 1);
    [self.view.layer addSublayer:myLayer];
    
    NSLog(@"myLayer.frame.origin x= %f,y = %f",myLayer.frame.origin.x,myLayer.frame.origin.y);
    
    NSLog(@"x=%f,y=%f",myLayer.position.x - myLayer.anchorPoint.x * myLayer.bounds.size.width,myLayer.position.y - myLayer.anchorPoint.y * myLayer.bounds.size.height);
    
    CALayer * verticalLayer = [CALayer layer];
    verticalLayer.bounds = CGRectMake(0, 0, 1, 100);
    verticalLayer.position = CGPointMake(100, 0);
    verticalLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:verticalLayer];
    
    CALayer * horizonLayer = [CALayer layer];
    horizonLayer.bounds = CGRectMake(0, 0, 100, 1);
    horizonLayer.position = CGPointMake(0, 100);
    horizonLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:horizonLayer];
}

#pragma mark -  创建倒影
- (void)createReflectionView {
    
    self.view.backgroundColor = [UIColor whiteColor];
    CALayer * contentLayer = [CALayer layer];
    UIImage * gledeImage = [UIImage imageNamed:@"sample_image6"];
    contentLayer.bounds = CGRectMake(0, 0, gledeImage.size.width, gledeImage.size.height);
    contentLayer.contents = (__bridge id _Nullable)(gledeImage.CGImage);
    contentLayer.position = CGPointMake(self.view.center.x, 10);
    contentLayer.anchorPoint = CGPointMake(0.5, 0);
    contentLayer.backgroundColor = [UIColor blueColor].CGColor;
    contentLayer.cornerRadius = 4.0;
    
    CALayer * reflection = [CALayer layer];
    reflection.bounds = contentLayer.bounds;
    reflection.position = CGPointMake(contentLayer.bounds.size.width/2, contentLayer.bounds.size.height * 1.5);
    reflection.contents = contentLayer.contents;
    reflection.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);

    CALayer * blackLayer = [CALayer layer];
    blackLayer.backgroundColor = [UIColor blackColor].CGColor;
    blackLayer.bounds = reflection.bounds;
    blackLayer.position = CGPointMake(blackLayer.bounds.size.width/2, blackLayer.bounds.size.height/2);
    blackLayer.opacity = 0.6;
    [reflection addSublayer:blackLayer];

    CAGradientLayer * mask = [CAGradientLayer layer];
    mask.bounds = CGRectMake(0, 0, reflection.bounds.size.width, reflection.bounds.size.height/2);
    mask.position = CGPointMake(mask.bounds.size.width/2, mask.bounds.size.height);
    mask.anchorPoint = CGPointMake(0.5, 0);
    mask.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,(id)[UIColor whiteColor].CGColor, nil];

    reflection.mask = mask;

    [contentLayer addSublayer:reflection];
    
    [self.view.layer addSublayer:contentLayer];
    
}

- (void)createUI {
    /*
    [self.view.layer setBackgroundColor:[UIColor blackColor].CGColor];
    UIImage * gledeImage = [UIImage imageNamed:@"sample_image6"];
    
    //图片层
    CALayer * topLayer = [[CALayer alloc] init];
    [topLayer setBounds:CGRectMake(0, 0, 300, 150)];
    [topLayer setPosition:CGPointMake(160, 120)];
    [topLayer setContents:(id)gledeImage.CGImage];
    [self.view.layer addSublayer:topLayer];
    
    //图片阴影层
    CALayer * reflectionLayer = [[CALayer alloc] init];
    [reflectionLayer setBounds:CGRectMake(0, 0, 300, 150)];
    [reflectionLayer setPosition:CGPointMake(160, 120)];
    [reflectionLayer setContents:[topLayer contents]];
    [reflectionLayer setValue:[NSNumber numberWithFloat:180] forKey:@"transform.rotation.x"];
    
    //渐变层
    CAGradientLayer * gradientLayer = [[CAGradientLayer alloc] init];
    [gradientLayer setBounds:reflectionLayer.bounds];
    [gradientLayer setPosition:CGPointMake(reflectionLayer.bounds.size.width/2, reflectionLayer.bounds.size.height/2)];
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor, nil]];
    [gradientLayer setStartPoint:CGPointMake(0.5, 0.35)];
    [gradientLayer setEndPoint:CGPointMake(0.5, 1.0)];
    [reflectionLayer setMask:gradientLayer];
    
    [self.view.layer addSublayer:reflectionLayer];
     */
    
    
    CGRect frame = self.view.frame;
    frame.origin.y += frame.size.height;
    
    self.myImageView.transform = CGAffineTransformMakeScale(1.0, -1.0);
    
    CALayer * reflectionLayer = [_myImageView layer];
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = reflectionLayer.bounds;
    gradientLayer.position = CGPointMake(reflectionLayer.bounds.size.width / 2, reflectionLayer.bounds.size.height * 0.5);
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor, nil]];
    
    gradientLayer.startPoint = CGPointMake(0.5, 0.5);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    
    reflectionLayer.mask = gradientLayer;
    
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
