//
//  MySixDrawMethodView.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/2/10.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "MySixDrawMethodView.h"

@implementation MyLayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    UIBezierPath * p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor blueColor] setFill];
    [p fill];
    UIGraphicsPopContext();
}

@end

@interface MySixDrawMethodView () {
    //实例变量,实例变量默认是strong
    MyLayerDelegate * _layerDelegate;
}

@end

@implementation MySixDrawMethodView

//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        CALayer * myLayer = [CALayer layer];
//        _layerDelegate = [[MyLayerDelegate alloc] init];
//        myLayer.delegate = _layerDelegate;
//        [self.layer addSublayer:myLayer];
//        [self setNeedsDisplay];// 调用此方法，drawLayer: inContext:方法才会被调用。
//    }
//    return self;
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //1.使用UIKit在Cocoa为我们提供的当前上下文中完成绘图任务。
//    UIBezierPath * p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    [[UIColor blueColor] setFill];
//    [p fill];
    
    //2.使用Core Graphics实现绘制蓝色圆。
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(con, CGRectMake(100, 100, 100, 100));
//    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
//    CGContextFillPath(con);

    //3.将在UIView子类的drawLayer:inContext：方法中实现绘图任务。
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//    //调用UIGraphicsPushContext 函数可以方便的将context：参数转化为当前上下文，记住最后别忘了调用UIGraphicsPopContext函数恢复上下文环境。
//    UIGraphicsPushContext(ctx);
//    UIBezierPath * p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 20, 100, 100)];
//    [[UIColor blueColor] setFill];
//    [p fill];
//    //函数恢复上下文环境
//    UIGraphicsPopContext();
    
    //4.使用Core Graphics的drawLayer:inContext: 方法实现同样的操作
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextFillPath(ctx);
}

@end
