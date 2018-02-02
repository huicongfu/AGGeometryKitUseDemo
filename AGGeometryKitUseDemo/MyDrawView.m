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
}


@end
