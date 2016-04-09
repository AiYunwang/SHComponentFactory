//
//  SHViewController.m
//  SHComponentFactory
//
//  Created by yaoqi on 04/09/2016.
//  Copyright (c) 2016 yaoqi. All rights reserved.
//

#import "SHComponentFactory.h"
#import "SHViewController.h"

@interface SHViewController ()

@end

@implementation SHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoButtonClicked:(id)sender {
    id page = [SHComponentFactory loadpage:@"testViewController" withParam:@{ @"name": @"yaoqi" }];
    [self.navigationController pushViewController:page animated:YES];
}

@end
