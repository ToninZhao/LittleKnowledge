//
//  NSObject+TZExterntion.h
//  GetPropertyList
//
//  Created by ZhaoNing on 16/8/23.
//  Copyright © 2016年 Tonin. All rights reserved.
//
/*
 *   通过runtime获取类的属性列表
 */
#import <Foundation/Foundation.h>

@interface NSObject (TZExterntion)
/*
 *   类方法,返回类实例化的对象
 */
+ (instancetype)tz_objcWithDictionary:(NSDictionary *)dic;
/*
 *   实例方法
 */
- (void)tz_objcWithDictionary:(NSDictionary *)dic;
@end
