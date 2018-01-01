//
//  ZXJsonString.m
//  JsonStr 转OC属性声明
//
//  Created by xinying on 2018/1/1.
//  Copyright © 2018年 habav. All rights reserved.
//

#import "ZXJsonString.h"

@implementation ZXJsonString

+(void)getPropertyWithDic:(NSDictionary *)dic{
    
    for (NSString *key in dic.allKeys) {
        id value =[dic objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            printf("@property (nonatomic, strong) NSString *%s;\n",[key UTF8String]);
        }else if ([value isKindOfClass:[NSNumber class]]) {
            printf("@property (nonatomic, assign) NSInteger %s;\n",[key UTF8String]);
        }else if ([value isKindOfClass:[NSArray class]]) {
            printf("@property (nonatomic, strong) NSArray<<#Objc *#>> *%s;\n",[key UTF8String]);
            NSInteger i =0;
            for (id obj in value) {
                
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    printf("\n%s [%ld]:\n",[key UTF8String],i);
                    [ZXJsonString getPropertyWithDic:obj];
                }
                i++;
            }
        }else if ([value isKindOfClass:[NSDictionary class]]) {
            printf("\n%s: \n",[key UTF8String]);
            [ZXJsonString getPropertyWithDic:value];
        }
    }
}


@end
