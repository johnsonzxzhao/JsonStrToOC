//
//  main.m
//  JsonStr 转OC属性声明
//
//  Created by xinying on 2018/1/1.
//  Copyright © 2018年 habav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXJsonString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        char s[6553400] ;
  
        NSMutableString *str =[NSMutableString stringWithCapacity:30];
        while (gets(s) &&s[0] != '\0') {
            [str appendString:[[NSString alloc]initWithCString:s encoding:NSUTF8StringEncoding]];
        }
        NSString *string =[NSString stringWithString:str];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
 
        NSData *data =[string dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"\n %@",dic);
        
        [ZXJsonString getPropertyWithDic:dic];

    }
    return 0;
}


