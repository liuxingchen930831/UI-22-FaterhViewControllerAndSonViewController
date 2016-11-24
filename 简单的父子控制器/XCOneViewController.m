//
//  XCOneViewController.m
//  简单的父子控制器
//
//  Created by liuxingchen on 16/11/24.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCOneViewController.h"

@interface XCOneViewController ()
@end
static NSString  * const cellID = @"cellID";
@implementation XCOneViewController

-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"one -- %ld",(long)indexPath.row];
    return cell;
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
}
@end
