//
//  MyQRViewController.m
//  ScanLifeDemo
//
//  Created by zYs on 15/8/18.
//  Copyright © 2015年 zYs. All rights reserved.
//

#import "MyQRViewController.h"

@interface MyQRViewController ()

@end

@implementation MyQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置状态栏的字体颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor =[UIColor clearColor];
    //设置导航栏标题的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"我的名片";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(clickbackButton:)];
}
#pragma mark - Checking backButton
-(void)clickbackButton:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
