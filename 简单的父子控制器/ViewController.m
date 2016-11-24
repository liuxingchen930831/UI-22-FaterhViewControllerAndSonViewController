//
//  ViewController.m
//  简单的父子控制器
//
//  Created by liuxingchen on 16/11/24.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "XCOneViewController.h"
#import "XCTwoViewController.h"
#import "XCThreeViewController.h"
@interface ViewController ()
/**one控制器 */
@property(nonatomic,strong)XCOneViewController * one ;
/**two控制器 */
@property(nonatomic,strong)XCTwoViewController * two ;
/**three控制器 */
@property(nonatomic,strong)XCThreeViewController * three ;

/** 显示的控制器*/
@property(nonatomic,weak)UIViewController  * showVC ;

@property(nonatomic,strong)NSArray * allVces ;
@end


/**
 如果2个控制器的view是父子关系(不管是直接还是间接的父子关系)，那么这2个控制器也应该为父子关系
 [a.view addSubView:b.view];
 [a addChildViewController:b];
 或者另一种情况 是间接的父子关系(otherView是a.view子控制器,c.view是otherView的子控制器)
 [a.view addSubView:otherView];
 [otherView addSubView:c];
 [c addChildViewController:otherView];
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器到父控制器中
    [self addChildViewController:[[XCOneViewController alloc]init]];
    [self addChildViewController:[[XCTwoViewController alloc]init]];
    [self addChildViewController:[[XCThreeViewController alloc]init]];
    
    //将子控制器中的第0个从childViewControllers数组中移除
//    [self.childViewControllers[0] removeFromParentViewController];
}

#pragma mark - 方法二添加自控制器需要三个button全部连这个方法
-(IBAction)addChildVC:(UIButton *)button
{
    [self.showVC.view removeFromSuperview];
    
    NSUInteger index = [button.superview.subviews indexOfObject:button];
    
    self.showVC = self.childViewControllers[index];
    
    self.showVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height -64);
    [self.view addSubview:self.showVC.view];
    NSLog(@"showVc = %lu",(unsigned long)index);     
}
#pragma mark - 方法一添加子控制器，这种方法监听不了子控制器或者子类做了那些事件
//- (IBAction)oneClick:(id)sender
//{
//    //简化方法
////    [self.showVC.view removeFromSuperview];
////    
////    self.showVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height -64);
////    [self.view addSubview:self.showVC.view];
//    
//    
//    if (_one ==nil) {
//        _one = [[XCOneViewController alloc]init];
//        _one.view.frame = CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height -64);
//    }
//    //把当前正在显示的view 从子控件移除
//    [self.showVC.view removeFromSuperview];
//    [self.view addSubview:_one.view];
//    self.showVC = _one;
//    //方法刚进来的时候showVC是空，所以移除的正在显示的view也是空，到了这里把one赋值给showVC。当我点击下一个方法的时候showVC就有值了，showvc显示的是one，走到下一个方法的removeFromSuperview 就会把showvc也就是one移除子控件
//}
//- (IBAction)twoClick:(id)sender
//{
//    if (_two ==nil) {
//        _two = [[XCTwoViewController alloc]init];
//        _two.view.frame = CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height -64);
//    }
//    [self.showVC.view removeFromSuperview];
//    NSLog(@"self.showVC = %@",[self.showVC class]);
//    [self.view addSubview:_two.view];
//    self.showVC = _two;
//}
//- (IBAction)threeClick:(id)sender
//{
//    if (_three ==nil) {
//        _three = [[XCThreeViewController alloc]init];
//        _three.view.frame = CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height -64);
//    }
//    [self.showVC.view removeFromSuperview];
//    [self.view addSubview:_three.view];
//    self.showVC = _three;
//}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
}
@end
