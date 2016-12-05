//
//  ViewController.m
//  lawage
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 com.ruitai. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "LawageAnimation.h"
#import "LawageTrans.h"

@interface ViewController ()
@property (nonatomic, strong) LawageTrans *trans;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.



    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(0, 0, 100, 100);
    self.btn.backgroundColor = [UIColor redColor];
    self.btn.center = self.view.center;
    [self.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];


    UIButton *bbb = [UIButton buttonWithType:UIButtonTypeSystem];
    bbb.frame = CGRectMake(100, 100, 100, 100);
    [bbb addTarget:self action:@selector(bbbbBtnClick) forControlEvents:UIControlEventTouchUpInside];
    bbb.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bbb];
}
- (void)btnClick {
    ViewController1 *vc = [[ViewController1 alloc] init];

    [self presentViewController:vc animated:YES completion:nil];
}
- (void)bbbbBtnClick {
    ViewController1 *vc = [[ViewController1 alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 设置代理
    self.trans = [[LawageTrans alloc] init];
    self.transitioningDelegate = self.trans;
    self.navigationController.delegate = self.trans;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
