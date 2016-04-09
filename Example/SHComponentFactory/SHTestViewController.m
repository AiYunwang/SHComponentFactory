//
//  SHTestViewController.m
//  SHComponentFactory
//
//  Created by yaoqi on 16/4/9.
//  Copyright © 2016年 yaoqi. All rights reserved.
//

#import "SHTestViewController.h"

@interface SHTestViewController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation SHTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试跳转页面";
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"TestViewController name = %@", self.name);
}

#pragma mark - WDViewControllerProtocol
+ (id)cratePage:(NSDictionary *)dictionary {
    SHTestViewController *page = [[SHTestViewController alloc] init];
    page.name = dictionary[@"name"];
    return page;
}


@end
