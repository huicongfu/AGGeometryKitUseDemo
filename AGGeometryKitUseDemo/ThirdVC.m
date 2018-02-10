//
//  ThirdVC.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/1/31.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "ThirdVC.h"
#import "MyDrawView.h"
#import "MyDrawView2.h"
#import "MyDrawView3.h"
#import "MyBrushView.h"
#import "MySixDrawMethodView.h"

@interface ThirdVC (){
    MyLayerDelegate * layerDelegate;
}

@property (nonatomic, retain) MyDrawView * view1;
@property (nonatomic, retain) MyDrawView2 * view2;
@property (nonatomic, retain) MyDrawView3 * view3;
@property (nonatomic, retain) MyBrushView * view4;
@property (nonatomic, retain) MySixDrawMethodView * view5;
@property (nonatomic, retain) UIImageView * myImageView;

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createUI];
    
//    [self createDarwUI];
//    [self createBrushView];
//    [self sixMethodDrawView];
    
    _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 256, 256)];
    [self.view addSubview:_myImageView];
    
//    [self translaImage];
//    [self scaleImage];
    [self cutImage];
}

#pragma mark -  UIImage 平移操作 下面的代码展示了如何将UIImage绘制在当前的上下文中。
- (void)translaImage {
    
    UIImage * mars = [self marsImage];
    
    CGSize sz = [mars size];
    
    _myImageView.frame = CGRectMake(20, 20, sz.width, sz.height);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width * 2, sz.height), NO, 0);
    
    [mars drawAtPoint:CGPointMake(0, 0)];
    
    [mars drawAtPoint:CGPointMake(sz.width, 0)];
    
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _myImageView.image = im;
    
}

#pragma mark -  UIImage 缩放操作
- (void)scaleImage {
    UIImage * mars = [self marsImage];
    
    CGSize sz = [mars size];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width * 2, sz.height * 2), NO, 0);
    
    [mars drawInRect:CGRectMake(0, 0, sz.width*2, sz.height * 2)];
    
    [mars drawInRect:CGRectMake(sz.width/2.0, sz.height/2.0, sz.width, sz.height) blendMode:kCGBlendModeMultiply alpha:1.0];
    
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    
    self.myImageView.image = im;
}

#pragma mark -  UIImage 裁剪操作
- (void)cutImage {
    UIImage * mars = [self marsImage];
    
    CGSize sz = [mars size];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width/2.0, sz.height), NO, 0);
    
    [mars drawAtPoint:CGPointMake(-sz.width/2.0, 0)];
    
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.myImageView.image = im;
    
}

- (UIImage *)marsImage {
    return [UIImage imageNamed:@"Mars"];
}

- (void)sixMethodDrawView {
//    self.view5 = [[MySixDrawMethodView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.view5];
    
    
//    //5.使用UIKit实现 UIGraphicsBeginImageContextWithOptions的用法
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
//    UIBezierPath * p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    [[UIColor blueColor] setFill];
//    [p fill];
//    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
    
    //6.使用Core Graphics 实现UIGraphicsBeginImageContextWithOptions的用法
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    CGContextFillPath(con);
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _myImageView.image = im;
}

- (void)createBrushView {
    
    self.view4 = [[MyBrushView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.view4];
}

- (void)createDarwUI {
    
    self.view3 = [[MyDrawView3 alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.view3];
}

- (void)createUI {
    self.view1 = [[MyDrawView alloc] initWithFrame:CGRectMake(50, 50, 300, 200)];
    [self.view addSubview:self.view1];
    
    
    self.view2 = [[MyDrawView2 alloc] initWithFrame:CGRectMake(50, 300, 300, 200)];
    [self.view addSubview:self.view2];
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
