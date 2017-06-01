//
//  ShareController.m
//  MyCode
//
//  Created by 中付支付 on 2017/6/1.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "ShareController.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>

@interface ShareController ()

@end

@implementation ShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)shareBtn:(id)sender {
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UIImage *image = [UIImage imageNamed:@"sharetest"];
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"分享测试" descr:@"this is a test" thumImage:image];
    //设置网页地址
    shareObject.webpageUrl = @"https://github.com/BigArray/MyCode.git";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    
//    //系统分享面板
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//        // 根据获取的platformType确定所选平台进行下一步操作
//        
//        [self shareWith:platformType UMSocialMessageObject:messageObject];
//    }];
    
    //自定义分享面板
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine),]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareWith:platformType UMSocialMessageObject:messageObject];
    }];
}

- (void)shareWith:(UMSocialPlatformType)type UMSocialMessageObject:(UMSocialMessageObject *)messageObject{
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        //        [self alertWithError:error];
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
