//
//  DrawImageController.m
//  MyCode
//
//  Created by 中付支付 on 2017/6/29.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "DrawImageController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface DrawImageController ()

@end

@implementation DrawImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"手动绘图";

    [self.drawRect initVariable];
    self.drawRect.backgroundColor = [UIColor whiteColor];
}

- (UIImage *)saveScreen{
    
    UIView *screenView = _drawRect;
    
    UIGraphicsBeginImageContext(screenView.bounds.size);
    [screenView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (IBAction)saveBtn:(id)sender {
    UIImage *imageForSave = [self saveScreen];
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:[imageForSave CGImage] orientation:(ALAssetOrientation)[imageForSave imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error){
        NSString *message = @"";
        if (error) {
            message = [error description];
        } else {
            message = @"成功保存到相册";
        }
        
        NSLog(@"相册路径: %@", assetURL);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }];

}

- (IBAction)clearBtn:(id)sender {
    [_drawRect clear];
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
