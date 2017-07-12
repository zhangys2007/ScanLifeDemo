//
//  QRViewController.m
//  ScanLifeDemo
//
//  Created by zYs on 15/8/17.
//  Copyright (c) 2015年 zYs. All rights reserved.
//

#import "QRViewController.h"
#import "QRCodeReaderViewController.h"
@interface QRViewController ()<QRCodeReaderDelegate>

@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置状态栏的字体颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //设置导航栏颜色

    self.navigationController.navigationBar.barTintColor =[UIColor blackColor];
    //设置导航栏标题的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.title = @"主页";
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, 200, 100, 40)];
    [btn setTitle:@"扫描二维码" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    btn.layer.cornerRadius = 5;
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(scanAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}

#pragma mark - UIButtonAction
//得到扫描结果--NSString
- (void)scanAction:(id)sender
{
    QRCodeReaderViewController *reader = [QRCodeReaderViewController new];
    reader.modalPresentationStyle = UIModalPresentationFormSheet;
    reader.delegate = self;
    
    __weak typeof (self) wSelf = self;
    [reader setCompletionWithBlock:^(NSString *resultAsString) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        wSelf.navigationController.navigationBarHidden = NO;
        [wSelf.navigationController popViewControllerAnimated:YES];
        [[[UIAlertView alloc] initWithTitle:@"扫描结果" message:resultAsString delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil] show];
        NSLog(@"扫描结果 == %@",resultAsString);
    }];
    
    //[self presentViewController:reader animated:YES completion:NULL];
    [self.navigationController pushViewController:reader animated:YES];
    reader.navigationController.navigationBarHidden = YES;
}
//- (void)readerDidCancel:(QRCodeReaderViewController *)reader
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
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
