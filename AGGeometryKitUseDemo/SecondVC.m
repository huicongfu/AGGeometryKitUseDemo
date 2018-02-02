//
//  SecondVC.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/1/31.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()
@property (strong, nonatomic) IBOutlet UIView *redView;

@property (strong, nonatomic) IBOutlet UIImageView *resizeImageView;
@property (strong, nonatomic) IBOutlet UIImageView *resizeImage2View;
@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.redView.layer.cornerRadius = 20.0;
//    self.redView.layer.masksToBounds = YES;
    
//    self.redView.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.redView.layer.shadowOffset = CGSizeMake(25, 25);
//    self.redView.layer.shadowOpacity = 0.5;
    UIImage * image = [UIImage imageNamed:@"sample_image6-1"];
//    self.resizeImageView.image = [self resizeImage:image toSize:CGSizeMake(100, 50)];
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        self.resizeImage2View.image = [self snapView:self.view];
    //    });
    
    
//    self.resizeImageView.image = [self cutImageMethodTwo:image toCutRect:CGRectMake(20, 20, 100, 50)];
//    self.resizeImage2View.image = [self cutImage:image toCutRect:CGRectMake(20, 20, 100, 50)];

    self.resizeImageView.image = [self imageFromColor:[UIColor yellowColor] size:CGSizeMake(100, 50)];
    self.resizeImage2View.image = [self imageMethodTwoFromColor:[UIColor yellowColor] size:CGSizeMake(100, 50)];
    
    
}

- (void)partCorner {
    CAShapeLayer * layer = [[CAShapeLayer alloc] init];
    layer.path = [UIBezierPath bezierPathWithRoundedRect:self.redView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)].CGPath;
    self.redView.layer.mask = layer;
}

/// 缩放图片
- (UIImage *)resizeImage:(UIImage *)image toSize:(CGSize )toSize {
    //开启一个上下文
    /// 设置为NO 表示背景不透明 -> 黑色
    /// 设置为 0 -> 可以自适应不同的屏幕的scale显示
    UIGraphicsBeginImageContextWithOptions(toSize, NO, 0);
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 转换坐标原点到左下角
    CGContextTranslateCTM(context, 0.0, toSize.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    // 设置绘制模式
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    //绘图
    CGContextDrawImage(context, CGRectMake(0, 0, toSize.width, toSize.height), image.CGImage);
    //取得图片
    UIImage * retrivedImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return retrivedImage;
}

///缩放图片2
- (UIImage *)resizeMethodTwoImage:(UIImage *)image toSize:(CGSize )toSize {
    //开启一个上下文
    /// 设置false 表示背景不透明 -> 黑色
    /// 设置为 0 -> 可以自适应不同的屏幕的scale显示
    UIGraphicsBeginImageContextWithOptions(toSize, NO, 0);
    //绘制图片
    [image drawInRect:CGRectMake(0, 0, toSize.width, toSize.height)];
    //取得图片
    UIImage * retrivedImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return retrivedImage;
}

/// 截屏1
- (UIImage *)snapView:(UIView *)targeView {
    UIGraphicsBeginImageContextWithOptions(targeView.bounds.size, NO, 0);
    //ios7 之后系统提供的截屏功能
    [targeView drawViewHierarchyInRect:targeView.bounds afterScreenUpdates:NO];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    /*
     2//这个方法会返回一个"截屏"后的view
     // withCapInsets  -> 这个和拉伸图片的image.resizableImageWithCapInsets()使用一样
     UIView * snapShotView = [targetView resizableSnapshotViewFromRect:targetView.bounds afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
     3// 区分和1中的使用  特别说明:renderInContext:方法在iOS8上会偶尔崩溃
     targetView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
     */
}

/// 1.裁剪图片的指定部分
- (UIImage *)cutImage:(UIImage *)image toCutRect:(CGRect)cutRect {
    
    UIGraphicsBeginImageContextWithOptions(cutRect.size, NO, 0.0);
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 转换坐标原点到左下角
    CGContextTranslateCTM(context, 0.0, cutRect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    //设置绘制模式
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    //绘制
    CGContextDrawImage(context, cutRect, image.CGImage);
    UIImage * cutImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cutImage;
}

/// 2.跟上面的裁剪图片方法有差异,慎用
- (UIImage *)cutImageMethodTwo:(UIImage *)image toCutRect:(CGRect)cutRect {
    UIGraphicsBeginImageContextWithOptions(cutRect.size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:cutRect];
    UIImage * cutImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cutImage;
}

/// 1.将颜色绘制为图片
- (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/// 2.将颜色绘制为图片
- (UIImage *)imageMethodTwoFromColor:(UIColor *)color size:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
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
