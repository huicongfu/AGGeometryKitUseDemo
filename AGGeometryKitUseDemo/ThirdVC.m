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
#import "MyTestDrawView.h"

@interface ThirdVC (){
    MyLayerDelegate * layerDelegate;
}

@property (nonatomic, retain) MyDrawView * view1;
@property (nonatomic, retain) MyDrawView2 * view2;
@property (nonatomic, retain) MyDrawView3 * view3;
@property (nonatomic, retain) MyBrushView * view4;
@property (nonatomic, retain) MySixDrawMethodView * view5;
@property (nonatomic, retain) MyTestDrawView * view6;

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
//    [self cutImage];
    
//    [self handleCGImage];
    
//    [self CoreImageUseMethod];
    
    [self classicDrawLine];
}

- (void)classicDrawLine {
    self.view6 = [[MyTestDrawView alloc] initWithFrame:self.view.bounds];
    self.view6.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.view6];
}

#pragma mark -  Core Image的用法 CIFilter看上去就像一个由键值组成的字典。它生成一个CIImage对象作为其输出。
- (void)CoreImageUseMethod {
    
    UIImage * moi = [self marsImage];
    
    CIImage * moi2 = [[CIImage alloc] initWithCGImage:moi.CGImage];
    
    CIFilter * grad = [CIFilter filterWithName:@"CIRadialGradient"];
    
    CIVector * center = [CIVector vectorWithX:moi.size.width / 2.0 Y:moi.size.height / 2.0];
    
    //使用setValue: forKey: 方法设置滤镜属性
    [grad setValue:center forKey:@"inputCenter"];
    
    //在指定滤镜名时提供所有滤镜键值对
    
    CIFilter * dark = [CIFilter filterWithName:@"CIDarkenBlendMode" keysAndValues:@"inputImage",grad.outputImage,@"inputBackgroundImage",moi2, nil];
    
    CIContext * c = [CIContext contextWithOptions:nil];
    
    CGImageRef moi3 = [c createCGImage:dark.outputImage fromRect:moi2.extent];
    
    UIImage * moi4 = [UIImage imageWithCGImage:moi3 scale:moi.scale orientation:moi.imageOrientation];
    
    CGImageRelease(moi3);
    
    self.myImageView.image = moi4;
    
}

// 翻转图片  其中一种方法就是使用CGContextDrawImage方法先将CGImage绘制到UIImage上，然后获取UIImage对应的CGImage，此时就得到了一个倒转的CGImage。当再调用CGContextDrawImage方法，我们就将倒转的图片还原回来了
CGImageRef flip (CGImageRef im) {
    CGSize sz = CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    
    UIGraphicsBeginImageContextWithOptions(sz, NO, 0);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    
    UIGraphicsEndImageContext();
    
    return result;
}

#pragma mark -  CGImage常用的绘图操作
- (void)handleCGImage {
    
    UIImage * mars = [self marsImage];
    
    CGSize sz = [mars size];
    
    //转换CGImage并使用对应的CGImage尺寸截取图片的左右部分
    CGImageRef marsCG = [mars CGImage];
    
    CGSize szCG = CGSizeMake(CGImageGetWidth(marsCG), CGImageGetHeight(marsCG));
    
    CGImageRef marsLeft = CGImageCreateWithImageInRect(marsCG, CGRectMake(0, 0, szCG.width/2.0, szCG.height));
    
    CGImageRef marsRight = CGImageCreateWithImageInRect(marsCG, CGRectMake(szCG.width/2.0, 0, szCG.width/2.0, szCG.height));
    
//    //抽取图片的左右半边 @2x图片会出错
//    CGImageRef marsLeft = CGImageCreateWithImageInRect([mars CGImage], CGRectMake(0, 0, sz.width/2.0, sz.height));
//
//    CGImageRef marsRight = CGImageCreateWithImageInRect([mars CGImage], CGRectMake(sz.width/2.0, 0, sz.width/2.0, sz.height));
    
    //将每一个CGImage绘制到图形上下文中
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*1.5, sz.height), NO, 0);
    
    //剩下的和之前的代码一样，修复倒置问题
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    
//    CGContextDrawImage(con, CGRectMake(0, 0, sz.width/2.0, sz.height), flip(marsLeft));
//
//    CGContextDrawImage(con, CGRectMake(sz.width, 0, sz.width/2.0, sz.height), flip(marsRight));
    
    [[UIImage imageWithCGImage:marsLeft scale:[mars scale] orientation:UIImageOrientationUp] drawAtPoint:CGPointMake(0, 0)];
    
    [[UIImage imageWithCGImage:marsRight scale:[mars scale] orientation:UIImageOrientationUp] drawAtPoint:CGPointMake(sz.width, 0)];
    
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.myImageView.image = im;
    
    //记得释放内存,ARC在这里无效
    CGImageRelease(marsLeft);
    CGImageRelease(marsRight);
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
