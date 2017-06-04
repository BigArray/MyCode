//
//  HttpRequestController.m
//  MyCode
//
//  Created by 张振飞 on 2017/5/22.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "HttpRequestController.h"
#import "HttpTool.h"

@interface HttpRequestController ()

@end

@implementation HttpRequestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //get请求
    [HttpTool getWithURL:@"" params:nil success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
    
    //post请求
    [HttpTool postWithURL:@"" params:nil success:^(id json) {
        
    } failure:^(NSError *error) {
        
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
