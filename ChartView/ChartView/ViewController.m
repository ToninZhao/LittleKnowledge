//
//  ViewController.m
//  ChartView
//
//  Created by ZhaoNing on 16/8/10.
//  Copyright © 2016年 Tonin. All rights reserved.
//

#import "ViewController.h"
#import "ChartView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ChartView *chartView = [[ChartView alloc] initWithFrame:CGRectMake(0, 50, 300, 300)];
    chartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
