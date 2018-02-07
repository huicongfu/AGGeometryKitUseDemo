//
//  MyDrawView2.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/2/6.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "MyDrawView2.h"

@implementation MyDrawView2


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath * bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 100)];
    bezier.lineWidth = 8.0;
    [[UIColor redColor] set];
    [[UIColor yellowColor] setFill];
    [bezier stroke];
    [bezier fill];
    
    NSString * str = @"你在红楼，我在西游";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blueColor]; // 文字颜色
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:11]; // 字体
    [str drawInRect:CGRectMake(20, 20, 100, 20) withAttributes:dict];
    
}


@end
