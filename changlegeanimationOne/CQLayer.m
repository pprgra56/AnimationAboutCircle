//
//  CQLayer.m
//  changlegeanimationOne
//
//  Created by 常琼 on 16/3/11.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "CQLayer.h"
#import <UIKit/UIKit.h>

#define CQWidth         self.frame.size.width
#define CQHeight        self.frame.size.height

#define RectWidth 100
#define hmcolor      [UIColor redColor]

@interface CQLayer()

@property (assign,nonatomic) CGRect outsideRect;
@property(assign,nonatomic) int flag;

@end


@implementation CQLayer

-(int)flag{
    if (_flag == 0){
        return 1;
    }else{
        return _flag;
    }
}

-(void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];

    
    CGFloat offset = RectWidth/3.6f;
    CGFloat moveA_Distance = RectWidth/5*(fabs(.5 -self.progress)*2);//18
    CGFloat moveB_Distance = (CQWidth-RectWidth)/2*(fabs(.5-self.progress)*2)*self.flag;//90
    NSLog(@"Joker moveb distance %f",moveB_Distance);
    
    
    CGPoint centerPoint = CGPointMake(CQWidth/2+moveB_Distance, CQHeight/2);
    
    
    
    CGPoint pointA =  CGPointMake(centerPoint.x, centerPoint.y-(RectWidth/2)+moveA_Distance);//
    CGPoint pointB = _flag>=0.5f? CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y):CGPointMake(centerPoint.x+(RectWidth/2)+2*moveA_Distance, centerPoint.y);
    CGPoint pointC =  CGPointMake(centerPoint.x, centerPoint.y+(RectWidth/2)-moveA_Distance);//
    CGPoint pointD = _flag>=0.5f? CGPointMake(centerPoint.x-(RectWidth/2)-2*moveA_Distance, centerPoint.y):CGPointMake(centerPoint.x-(RectWidth/2), centerPoint.y);
    
    CGPoint c1 =  CGPointMake(centerPoint.x+offset, centerPoint.y-(RectWidth/2)+moveA_Distance);
    CGPoint c2 =  _flag>=0.5f? CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y-offset):CGPointMake(centerPoint.x+(RectWidth/2)+2*moveA_Distance,  centerPoint.y-offset+moveA_Distance);
    
    CGPoint c3 =  _flag>=0.5f? CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y+offset):CGPointMake(centerPoint.x+(RectWidth/2)+2*moveA_Distance, centerPoint.y+offset-moveA_Distance);
    CGPoint c4 =  CGPointMake(centerPoint.x+offset, centerPoint.y+(RectWidth/2)-moveA_Distance);//
    CGPoint c5 =  CGPointMake(centerPoint.x-offset, centerPoint.y+(RectWidth/2)-moveA_Distance);//
    CGPoint c6 = _flag>=0.5f? CGPointMake(centerPoint.x-(RectWidth/2)-2*moveA_Distance, centerPoint.y+offset-moveA_Distance):CGPointMake(centerPoint.x-(RectWidth/2), centerPoint.y+offset);
    CGPoint c7 =  _flag>=0.5f? CGPointMake(centerPoint.x-(RectWidth/2)-2*moveA_Distance, centerPoint.y-offset+moveA_Distance):CGPointMake(centerPoint.x-(RectWidth/2), centerPoint.y-offset);
    CGPoint c8 =  CGPointMake(centerPoint.x-offset, centerPoint.y-(RectWidth/2)+moveA_Distance);//
    
    
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath moveToPoint: pointA];
    [ovalPath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
    [ovalPath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
    [ovalPath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
    [ovalPath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
    [ovalPath closePath];
    
    CGContextAddPath(ctx, ovalPath.CGPath);

    CGContextSetFillColorWithColor(ctx, hmcolor.CGColor);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
}

-(void)setProgress:(float)progress{

    _progress = progress;
    
    if(_progress >= 0.5f){
        self.flag = 1;
    }else{
        self.flag = -1;
    }
    
    
    [self setNeedsDisplay];
}



@end
