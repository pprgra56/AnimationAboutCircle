//
//  ViewController.m
//  changlegeanimationOne
//
//  Created by 常琼 on 16/3/11.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"
#import "CQView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *kailan;
@property (weak, nonatomic) IBOutlet UISlider *fuckingSlider;
@property (weak, nonatomic) IBOutlet CQView *CQview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //first time
    self.CQview.progress = self.fuckingSlider.value;
    [self.fuckingSlider addTarget:self action:@selector(numberChanged:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"Joker -%f %f width:%f height = %f",self.CQview.frame.origin.x,self.CQview.frame.origin.y,self.CQview.frame.size.width,self.CQview.frame.size.height);

    [self.CQview initWithCQLayerFrame:self.CQview.frame];
    
    
    
}
-(void)numberChanged:(UISlider *)sender{
    
    [self.kailan setText:[NSString stringWithFormat:@"%f",sender.value]];
    
    self.CQview.progress = sender.value;
    
}

@end
