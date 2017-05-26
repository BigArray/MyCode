//
//  ScanQrcodeController.m
//  MyCode
//
//  Created by 中付支付 on 2017/5/26.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "ScanQrcodeController.h"
#import "SGQRCode.h"
#import "ScanSuccessController.h"

@interface ScanQrcodeController ()


@end

@implementation ScanQrcodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 注册观察者
    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeAibum:) name:SGQRCodeInformationFromeAibum object:nil];
    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeScanning:) name:SGQRCodeInformationFromeScanning object:nil];
}

- (void)SGQRCodeInformationFromeAibum:(NSNotification *)noti {
    NSString *string = noti.object;
    
    NSLog(@"%@", string);
    ScanSuccessController *jumpVC = [[ScanSuccessController alloc] init];
    jumpVC.codeString = string;
    [self.navigationController pushViewController:jumpVC animated:YES];
}

- (void)SGQRCodeInformationFromeScanning:(NSNotification *)noti {
    
    NSString *string = noti.object;
    
    if ([string hasPrefix:@"http"]) {
        ScanSuccessController *jumpVC = [[ScanSuccessController alloc] init];
        jumpVC.codeString = string;
        [self.navigationController pushViewController:jumpVC animated:YES];
        
    } else { // 扫描结果为条形码
        
        ScanSuccessController *jumpVC = [[ScanSuccessController alloc] init];
        jumpVC.codeString = string;
        [self.navigationController pushViewController:jumpVC animated:YES];
    }
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
