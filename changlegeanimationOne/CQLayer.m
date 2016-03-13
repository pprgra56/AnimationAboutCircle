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
#define hmcolor  [UIColor colorWithRed:((arc4random() % 255) + 1)/255.0f green:((arc4random() % 255) + 1) /255.0f blue:((arc4random() % 255) + 1) /255.0f alpha:1]

@interface CQLayer()

@property (assign,nonatomic) CGRect outsideRect;

@end


@implementation CQLayer

-(void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];
    
    CGFloat offset = RectWidth/3.6f;
    CGFloat moveA_Distance = RectWidth/5*(fabs(.5 -self.progress)*2);//18
    CGFloat moveB_Distance = (CQWidth-RectWidth)/2*(fabs(.5-self.progress)*2);//90
    
    
    
    

    CGPoint centerPoint = CGPointMake(CQWidth/2+moveB_Distance, CQHeight/2);
    
    
    
    NSLog(@"-----------------------------------------------------------------------------");
//    NSLog(@"Joker move_A distance %f",moveA_Distance);
//    NSLog(@"Joker move_B distance %f",moveB_Distance);
//    NSLog(@"Joker centerPoint (%f,%f)",centerPoint.x,centerPoint.y);
    
    if(self.progress>.5f){
        
        CGPoint pointA =  CGPointMake(centerPoint.x, centerPoint.y-(RectWidth/2)+moveA_Distance);//
        CGPoint pointB =  CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y);//
        CGPoint pointC =  CGPointMake(centerPoint.x, centerPoint.y+(RectWidth/2)-moveA_Distance);//
        CGPoint pointD =  CGPointMake(centerPoint.x-(RectWidth/2)-2*moveA_Distance, centerPoint.y);//
        
        CGPoint c1 =  CGPointMake(centerPoint.x+offset, centerPoint.y-(RectWidth/2)+moveA_Distance);
        CGPoint c2 =  CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y-offset);//
        CGPoint c3 =  CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y+offset);//
        CGPoint c4 =  CGPointMake(centerPoint.x+offset, centerPoint.y+(RectWidth/2)-moveA_Distance);//
        CGPoint c5 =  CGPointMake(centerPoint.x-offset, centerPoint.y+(RectWidth/2)-moveA_Distance);//
        CGPoint c6 =  CGPointMake(centerPoint.x-(RectWidth/2)-2*moveA_Distance, centerPoint.y+offset-moveA_Distance);//
        CGPoint c7 =  CGPointMake(centerPoint.x-(RectWidth/2)-2*moveA_Distance, centerPoint.y-offset+moveA_Distance);//
        CGPoint c8 =  CGPointMake(centerPoint.x-offset, centerPoint.y-(RectWidth/2)+moveA_Distance);//
        /*
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:pointA];
        [path addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
        [path addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
        [path addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
        [path addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
        
        NSLog(@"Joker pA (%f,%f)",pointA.x,pointA.y);
        NSLog(@"Joker c2 (%f,%f)",c2.x,c2.y);
        
        
        
        [path closePath];
        CGContextAddPath(ctx, path.CGPath);
        
        
        
        

        CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);

        
        
        CGContextSetFillColorWithColor(ctx, hmcolor .CGColor);

        CGContextFillPath(ctx);
        CGContextStrokePath(ctx);
        */
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath moveToPoint: pointA];
        [ovalPath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
        [ovalPath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
        [ovalPath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
        [ovalPath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
        [ovalPath closePath];
        
        CGContextAddPath(ctx, ovalPath.CGPath);
        //  CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
        CGContextSetFillColorWithColor(ctx, hmcolor.CGColor);
        
        CGContextDrawPath(ctx, kCGPathFillStroke);
 
    }else if (self.progress == .5f){
        
        CGFloat offset = RectWidth/3.6f;
        CGFloat moveA_Distance = RectWidth/5*(fabs(.5 -self.progress)*2);
        CGFloat moveB_Distance = (CQWidth-RectWidth)/2*(fabs(.5-self.progress)*2);
        
        CGPoint centerPoint = CGPointMake(CQWidth/2, CQHeight/2);
        
        CGPoint pointA =  CGPointMake(centerPoint.x, centerPoint.y-(RectWidth/2));
        CGPoint pointB =  CGPointMake(centerPoint.x+(RectWidth/2), centerPoint.y);
        CGPoint pointC =  CGPointMake(centerPoint.x, centerPoint.y+(RectWidth/2));
        CGPoint pointD =  CGPointMake(centerPoint.x-(RectWidth/2), centerPoint.y);
        
        
        
        CGPoint c1 =  CGPointMake(pointA.x+offset, pointA.y);
        CGPoint c2 =  CGPointMake(pointB.x, pointB.y-offset);
        CGPoint c3 =  CGPointMake(pointB.x, pointB.y+offset);
        CGPoint c4 =  CGPointMake(pointC.x+offset, pointC.y);
        CGPoint c5 =  CGPointMake(pointC.x-offset, pointC.y);
        CGPoint c6 =  CGPointMake(pointD.x, pointD.y+offset);
        CGPoint c7 =  CGPointMake(pointD.x, pointD.y-offset);
        CGPoint c8 =  CGPointMake(pointA.x-offset, pointA.y);
        
        
        
        
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:pointA];
        [path addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
        [path addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
        [path addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
        [path addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
        
        [path closePath];
        CGContextAddPath(ctx, path.CGPath);
        CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
        CGContextFillPath(ctx);
        CGContextStrokePath(ctx);
        NSLog(@"Joker pA (%f,%f)",pointA.x,pointA.y);
        NSLog(@"Joker c1 (%f,%f)",c1.x,c1.y);
        
        
        
    }
    
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((11+_progress*100), 11+(_progress*100))];
    [path addLineToPoint:CGPointMake(100+_progress*100, 100+_progress*100)];
    [path closePath];
    [path stroke];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);

    
    
}

-(void)setProgress:(float)progress{

    _progress = progress;
     
    
    [self setNeedsDisplay];
}



@end
