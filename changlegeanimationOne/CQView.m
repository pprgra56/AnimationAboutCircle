//
//  CQView.m
//  changlegeanimationOne
//
//  Created by 常琼 on 16/3/11.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "CQView.h"
#import "CQLayer.h"


@interface CQView()

@property(strong,nonatomic) CQLayer *CQlayer;

@property(assign,nonatomic) float p;

@end

@implementation CQView

-(void)initWithCQLayerFrame:(CGRect )rect{

    self.CQlayer = [CQLayer layer];
    self.CQlayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);

    self.CQlayer.progress = self.p;
    [self.layer addSublayer:self.CQlayer];
    
}


-(void)setProgress:(float)progress{
    self.p = progress;
}


@end
