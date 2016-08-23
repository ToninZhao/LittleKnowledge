//
//  ViewController.m
//  GetPropertyList
//
//  Created by ZhaoNing on 16/8/23.
//  Copyright © 2016年 Tonin. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+TZExterntion.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"age" : @30, @"name" : @"tonin", @"height" : @178.5, @"info" : @{ @"msg" : @"hahaha"}};
//    ViewController *vc = [[self class] tz_objcWithDictionary:dic];
//    NSLog(@"%@, %ld, %.2f, %@", vc.name, vc.age, vc.height, vc.info);
    [self tz_objcWithDictionary:dic];
    NSLog(@"%@, %ld, %.2f, %@", self.name, self.age, _height, _info);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
