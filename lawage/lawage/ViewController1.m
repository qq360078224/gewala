//
//  ViewController1.m
//  lawage
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 com.ruitai. All rights reserved.
//

#import "ViewController1.h"
#import "LawageAnimation.h"
#import "ViewController.h"
#import "LawageTrans.h"
@interface ViewController1 ()
@property (nonatomic, strong) LawageTrans *trans;
@end
@implementation ViewController1
- (void)viewDidLoad {

    [super viewDidLoad];
    // 设置代理
    self.trans = [[LawageTrans alloc] init];
//    self.navigationController.delegate = self.trans;
    self.transitioningDelegate = self.trans;

    self.view.backgroundColor = [UIColor whiteColor];
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(0, 0, 100, 100);
    self.btn.backgroundColor = [UIColor redColor];
    self.btn.center = self.view.center;
    [self.btn addTarget:self action:@selector(bbbb) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];



    UIButton *bbb = [UIButton buttonWithType:UIButtonTypeSystem];
    bbb.frame = CGRectMake(100, 100, 100, 100);
    [bbb addTarget:self action:@selector(bbbbBtnClick) forControlEvents:UIControlEventTouchUpInside];
    bbb.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bbb];

}

- (void)bbbbBtnClick {

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)bbbb {

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
