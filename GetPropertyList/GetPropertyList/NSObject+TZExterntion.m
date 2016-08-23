//
//  NSObject+TZExterntion.m
//  GetPropertyList
//
//  Created by ZhaoNing on 16/8/23.
//  Copyright © 2016年 Tonin. All rights reserved.
//

#import "NSObject+TZExterntion.h"
#import <objc/runtime.h>
@implementation NSObject (TZExterntion)

+ (instancetype)tz_objcWithDictionary:(NSDictionary *)dic {
    id objc = [self new];
    NSArray *propertyList = [self tz_getProperties];
     [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         if ([propertyList containsObject:key]) {
             [objc setValue:obj forKey:key];
         }
     }];
    return objc;
}

- (void)tz_objcWithDictionary:(NSDictionary *)dic {
    NSArray *propertyList = [self.class tz_getProperties];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([propertyList containsObject:key]) {
            [self setValue:obj forKey:key];
        }
    }];
}

+ (NSArray *)tz_getProperties {
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:outCount];
    
    for (int i = 0 ; i < outCount; i++) {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [arrM addObject:propertyName];
    }
    free(propertyList);
    return arrM.copy;
}
@end
