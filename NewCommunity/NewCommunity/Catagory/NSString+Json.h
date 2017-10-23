//
//  NSString+Json.h
//  EveryDay
//
//  Created by shenxu on 15/7/22.
//  Copyright (c) 2015年 江涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Json)

+(NSString *)jsonStringWithObject:(id)theData;

/**
 *  字典转换成json字符串
 *
 *  @param dic 字典
 *
 *  @return 字符串
 */
+ (NSString*)jsonStringWithDictionary:(NSDictionary *)dic;
/**
 *  DES 加密
 *
 *  @param sText 要加密的数据
 *
 *  @return 字符串
 */
+ (NSString *)encryptWithText:(NSString *)sText;//加密
/**
 *  DES 解密
 *
 *  @param sText 要揭秘的数据
 *
 *  @return 解密后字符串
 */
+ (NSString *)decryptWithText:(NSString *)sText;//解密
/**
 *  时间戳转换成标准时间
 *
 *  @param timestamp <#timestamp description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)prettyDateWithReference:(long long int)oldOpt andSystemNowTime:(long long int)nowOpt;

-(NSString *)NSDateToNString:(NSDate *)date;

-(long long int)NSDateToNSTime:(NSDate *)date;


@end
