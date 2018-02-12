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
    
}


@end
