//
//  XCTwoViewController.m
//  简单的父子控制器
//
//  Created by liuxingchen on 16/11/24.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCTwoViewController.h"

@interface XCTwoViewController ()

@end

@implementation XCTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
}
@end
