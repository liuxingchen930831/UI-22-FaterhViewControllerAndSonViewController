## 控制器父子关系的建立原则
- 如果2个控制器的view是父子关系(不管是直接还是间接的父子关系)，那么这2个控制器也应该为父子关系

```
[a.view addSubview:b.view];
[a addChildViewController:b];
// 或者
[a.view addSubview:otherView];
[otherView addSubbiew.b.view];
[a addChildViewController:b];
```

## 获得所有的子控制器

```
@property(nonatomic,readonly) NSArray *childViewControllers;
```

## 添加一个子控制器
```
//XMGOneViewController成为了self的子控制器
//self成为了XMGOneViewController的父控制器
[self addChildViewController:[[XMGOneViewController alloc] init]];
// 通过addChildViewController添加的控制器都会存在于childViewControllers数组中
```

## 获得父控制器
```
@property(nonatomic,readonly) UIViewController *parentViewController;
```

## 将一个控制器从它的父控制器中移除
```
// 控制器a从它的父控制器中移除
[a removeFromParentViewController];
```