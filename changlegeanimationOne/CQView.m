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



@end

@implementation CQView

-(CQLayer *)CQlayer{
    if (_CQlayer == nil){
        _CQlayer = [CQLayer layer];
    }
    return _CQlayer;
}

-(void)initWithCQLayerFrame:(CGRect )rect{


    self.CQlayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);

    self.CQlayer.progress = _progress;


        
    [self.layer addSublayer:self.CQlayer];
        


    
}


-(void)setProgress:(float)progress{
    _progress = progress;
    self.CQlayer.progress = progress;
}


@end
