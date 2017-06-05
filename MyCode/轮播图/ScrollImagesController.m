//
//  ScrollImagesController.m
//  MyCode
//
//  Created by 中付支付 on 2017/6/2.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "ScrollImagesController.h"
#import <SDCycleScrollView.h>

@interface ScrollImagesController ()<SDCycleScrollViewDelegate>

@end

@implementation ScrollImagesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    SDCycleScrollView *cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 140) delegate:self placeholderImage:[UIImage imageNamed:@"4"]];
    cycleView.localizationImageNamesGroup = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
    [self.view addSubview:cycleView];
}

#pragma mark 代理方法
#pragma mark 点击图片
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"点击了第%zd个", index+1] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
