//
//  MyDrawView.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/2/2.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "MyDrawView.h"

@implementation MyDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * strokeColor = [UIColor blueColor];
   
    /*
    //设置stroke模式的颜色使用CGColor
    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    //设置线的宽度
    CGContextSetLineWidth(context, 6.0);
    // 设置连接处样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //起始点
    CGContextMoveToPoint(context, 10, 10);
    //在点(10.0,10.0)和(10.0,80.0)之间画一条线 所以点(10.0,80.0)被设置为下一个起始点
    CGContextAddLineToPoint(context, 10.0, 80.0);
    //在点(10.0, 80.0)和(80.0, 80.0)之间画一条线 所以点(80.0, 80.0)被设置为下一个起始点
    CGContextAddLineToPoint(context, 80.0, 80.0);
    
    //设置为封闭路径,会将首尾点连接起来
//    CGContextClosePath(context);
    
    //绘制当前的路径
    CGContextStrokePath(context);
     */
    
    /*
    CGContextSetFillColorWithColor(context, strokeColor.CGColor);
    //起始点
    CGContextMoveToPoint(context, 10.0, 10.0);
    CGContextAddLineToPoint(context, 10.0, 80.0);
    CGContextAddLineToPoint(context, 80.0, 80.0);
   // CGContextClosePath(context);
    CGContextFillPath(context);
     */
    
    /*
    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //起始点
    CGPoint circleCenter = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGContextMoveToPoint(context, circleCenter.x * 2, circleCenter.y);
    
    CGContextAddArc(context, circleCenter.x, circleCenter.y, rect.size.width*0.5, 0.0, M_PI * 2, 0);
    CGContextStrokePath(context);
     */
    
    
    CGContextSetFillColorWithColor(context, strokeColor.CGColor);
    CGPoint circleCenter = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGContextMoveToPoint(context, circleCenter.x * 2, circleCenter.y);
    // 画圆
    // x -> 圆心的x坐标
    // y -> 圆心的y坐标
    // radius -> 圆的半径
    // startAngle -> 起始角度 (弧度制) 所以上面调整了起始点
    // endAngle -> 结束角度(弧度制)
    CGContextAddArc(context, circleCenter.x, circleCenter.y, rect.size.width * 0.5, 0.0, M_PI * 2, 0);
    // 绘制当前的路径
    CGContextFillPath(context);

    
}


@end
