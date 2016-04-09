//
//  WDComponentFactory.h
//  IOS-WeidaiCreditLoan
//
//  Created by yaoqi on 16/3/30.
//  Copyright © 2016年 . All rights reserved.
//

/**
 *  组件化工厂文件
 */

#import "SHViewControllerProtocol.h"
#import <Foundation/Foundation.h>

@interface SHComponentFactory : NSObject

/**
 *  注册在componentreg.xml文件中的类
 *
 *  @param xml xml文件名
 *
 *  说明：此方法在AppDelegate文件的didFinishLaunchingWithOptions中调用注册，将所有类加载进内存中
 *  例如：[SHComponentFactory regesiterXml:@"componentreg.xml"];
 */
+ (void)regesiterXml:(NSString *)xml;

/**
 *  加载页面
 *
 *  @param pageName 需要加载的页面名称
 *  @param param    加载页面是要传过去的参数
 *
 *  @return 返回加载页面的类实例
 *
 *  例如：id page = [SHComponentFactory loadpage:@"loginpage" withParam:@{ @"name": @"zhangsan" }];
 */
+ (id<SHViewControllerProtocol>)loadpage:(NSString *)pageName withParam:(NSDictionary *)param;

@end
