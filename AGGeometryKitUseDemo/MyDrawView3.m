//
//  MyDrawView3.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/2/8.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "MyDrawView3.h"

@interface MyDrawView3 ()

@property (nonatomic, retain) UIBezierPath * path;

@end

@implementation MyDrawView3

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //create a mutable path
        self.path = [[UIBezierPath alloc] init];
        self.path.lineJoinStyle = kCGLineJoinRound;
        self.path.lineCapStyle = kCGLineCapRound;
        
        self.path.lineWidth = 5;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    [self.path moveToPoint:point];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}
*/

@end
