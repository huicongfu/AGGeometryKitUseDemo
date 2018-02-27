//
//  MyTestDrawView.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/2/11.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "MyTestDrawView.h"

@implementation MyTestDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(ctx);
//    {
        //绘图代码
//     }
//    CGContextRestoreGState(ctx);
    /*
    //绘制一个箭头 方法1
    CGContextRef con = UIGraphicsGetCurrentContext();
    
   //绘制一个黑色的垂直黑色线,作为箭头的杆子
    CGContextMoveToPoint(con, 100, 100);
    CGContextAddLineToPoint(con, 100, 19);
    CGContextSetLineWidth(con, 20);
    CGContextStrokePath(con);
    
    //绘制一个红色三角形箭头
    CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
    CGContextMoveToPoint(con, 80, 25);
    CGContextAddLineToPoint(con, 100, 0);
    CGContextAddLineToPoint(con, 120, 25);
    CGContextFillPath(con);
    
    //从箭头杆子上裁掉一个三角形,使用清除混合模式
    CGContextMoveToPoint(con, 90, 101);
    CGContextAddLineToPoint(con, 100, 90);
    CGContextAddLineToPoint(con, 110, 101);
    CGContextSetBlendMode(con, kCGBlendModeClear);
    CGContextFillPath(con);
    
    
    //绘制一个箭头 方法2
    UIBezierPath * p = [UIBezierPath bezierPath];
    [p moveToPoint:CGPointMake(100, 100)];
    [p addLineToPoint:CGPointMake(100, 19)];
    [p setLineWidth:20];
    [p stroke];
    
    [[UIColor redColor] set];
    [p removeAllPoints];
    [p moveToPoint:CGPointMake(80, 25)];
    [p addLineToPoint:CGPointMake(100, 0)];
    [p addLineToPoint:CGPointMake(120, 25)];
    [p fill];
    
    [p removeAllPoints];
    [p moveToPoint:CGPointMake(90, 101)];
    [p addLineToPoint:CGPointMake(100, 90)];
    [p addLineToPoint:CGPointMake(110, 101)];
    [p fillWithBlendMode:kCGBlendModeClear alpha:1.0];
    
    //左右圆角的矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 3);
    
    UIBezierPath * p2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 100, 100, 100) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
//    [p2 setLineWidth:3];
    [p2 stroke];
    
    
    //绘制一个箭头 利用 裁剪 来做 方法3
    CGContextRef con = UIGraphicsGetCurrentContext();
    //在上下文裁剪区中挖一个三角形状的孔
    CGContextMoveToPoint(con, 90, 100);
    CGContextAddLineToPoint(con, 100, 90);
    CGContextAddLineToPoint(con, 110, 100);
    CGContextClosePath(con);
    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
    
    //使用奇偶规则,裁剪区域为矩形减去三角形区域
    CGContextEOClip(con);
    //绘制垂线
    CGContextMoveToPoint(con, 100, 100);
    CGContextAddLineToPoint(con, 100, 19);
    CGContextSetLineWidth(con, 20);
    CGContextStrokePath(con);
    
    //画红色箭头
    CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
    CGContextMoveToPoint(con, 80, 25);
    CGContextAddLineToPoint(con, 100, 0);
    CGContextAddLineToPoint(con, 120, 25);
    CGContextFillPath(con);
    
     */
    
    //渐变
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSaveGState(con);
    
    //在上下文裁剪区域挖一个三角形孔
    CGContextMoveToPoint(con, 90, 100);
    CGContextAddLineToPoint(con, 100, 90);
    CGContextAddLineToPoint(con, 110, 100);
    CGContextClosePath(con);
    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
    CGContextEOClip(con);
    
    //绘制一个垂线,让它的轮廓形状为裁剪区域
    CGContextMoveToPoint(con, 100, 100);
    CGContextAddLineToPoint(con, 100, 19);
    CGContextSetLineWidth(con, 20);
    
    //使用路径的描边版本替换图形上下文的路径
    CGContextReplacePathWithStrokedPath(con);
    
    //对路径的描边版本实施裁剪
    CGContextClip(con);
    
    //绘制渐变
    CGFloat locs[3] = {0.0, 0.5, 1.0};
    CGFloat colors[12] = {
        0.3,0.3,0.3,0.8, // 开始颜色，透明灰
        0.0,0.0,0.0,1.0, // 中间颜色,黑色
        0.3,0.3,0.3,0.8 //末尾颜色,透明灰
    };
    
    CGColorSpaceRef sp = CGColorSpaceCreateDeviceGray();
    CGGradientRef grad = CGGradientCreateWithColorComponents(sp, colors, locs, 3);
    CGContextDrawLinearGradient(con, grad, CGPointMake(89, 0), CGPointMake(111, 0), 0);
    CGColorSpaceRelease(sp);
    CGGradientRelease(grad);
    CGContextRestoreGState(con); //完成裁剪
    
    //绘制红色箭头
    //作为一个非常简单的例子，我将使用红蓝相间的三角形替换箭头的三角形部分。现在移除下面行：
//    CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
    //在被移除的地方填入下面代码：
    CGColorSpaceRef sp2 = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(con, sp2);
    CGColorSpaceRelease(sp2);
    CGPatternCallbacks callback = {0, &drawStripes, NULL};
    CGAffineTransform tr = CGAffineTransformIdentity;
    CGPatternRef patt = CGPatternCreate(NULL, CGRectMake(0, 0, 4, 4), tr, 4, 4, kCGPatternTilingConstantSpacingMinimalDistortion, true, &callback);
    CGFloat alph = 1.0;
    CGContextSetFillPattern(con, patt, &alph);
    CGPatternRelease(patt);
    
    CGContextMoveToPoint(con, 80, 25);
    CGContextAddLineToPoint(con, 100, 0);
    CGContextAddLineToPoint(con, 120, 25);
    CGContextFillPath(con);
    
    //图形上下文变换 CTM "当前变换矩阵" - "current transformation matrix"
    
    
}

void drawStripes (void * info, CGContextRef con) {
    // assume 4 * 4 cell
    CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
    CGContextFillRect(con, CGRectMake(0, 0, 4, 4));
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    CGContextFillRect(con, CGRectMake(0, 0, 4, 2));
}

@end
