//
//  ViewController.m
//  TestQuartz_涂鸦
//
//  Created by admin on 15-1-15.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "TuYaimaView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TuYaimaView *view = [[TuYaimaView alloc] initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    [view viewAddIma:@"4.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
