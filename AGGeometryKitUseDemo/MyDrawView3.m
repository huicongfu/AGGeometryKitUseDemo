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

+ (Class)layerClass {
    //this makes our view create a CAShapeLayer
    //instead of a CALayer for its backing layer
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //create a mutable path
        self.path = [[UIBezierPath alloc] init];
        
//        self.path.lineJoinStyle = kCGLineJoinRound;
//        self.path.lineCapStyle = kCGLineCapRound;
//        self.path.lineWidth = 5;
        
        //configure the layer
        CAShapeLayer * shapeLayer = (CAShapeLayer *)self.layer;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.lineWidth = 5;
        
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //get the current point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add a new line segment to our path
    [self.path addLineToPoint:point];
    
    //update the layer with a copy of the path
    ((CAShapeLayer *)self.layer).path = self.path.CGPath;
    
    //redraw the view
//    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //draw path
    [[UIColor clearColor] setFill];
    [[UIColor redColor] setStroke];
    [self.path stroke];
    
}
*/

@end
