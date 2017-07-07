//
//  GenerateQrcodeController.m
//  MyCode
//
//  Created by 中付支付 on 2017/5/26.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "GenerateQrcodeController.h"
#import "SGQRCode.h"

@interface GenerateQrcodeController ()

@end

@implementation GenerateQrcodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createQrcodeWith:_codeStr];
    
    [self createLogoQrcodeWith:_codeStr];
    
    [self createColorsQrcodeWith:_codeStr];
}

//生成正常二维码
- (void)createQrcodeWith:(NSString *)string{
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = 150;
    CGFloat imageViewX = (Width - imageViewW) / 2;
    CGFloat imageViewY = 100;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:string imageViewWidth:imageViewW];
    
    CGFloat scale = 0.22;
    CGFloat borderW = 5;
    UIView *borderView = [[UIView alloc] init];
    CGFloat borderViewW = imageViewW * scale;
    CGFloat borderViewH = imageViewH * scale;
    CGFloat borderViewX = 0.5 * (imageViewW - borderViewW);
    CGFloat borderViewY = 0.5 * (imageViewH - borderViewH);
    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
    borderView.layer.borderWidth = borderW;
    borderView.layer.borderColor = [UIColor purpleColor].CGColor;
    borderView.layer.cornerRadius = 10;
    borderView.layer.masksToBounds = YES;
    borderView.layer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
}

//生成带logo二维码
- (void)createLogoQrcodeWith:(NSString *)string{
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = 150;
    CGFloat imageViewX = (Width - imageViewW) / 2;
    CGFloat imageViewY = 260;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:string logoImageName:@"car" logoScaleToSuperView:0.2];
}

//生成彩色二维码
- (void)createColorsQrcodeWith:(NSString *)string{
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = 150;
    CGFloat imageViewX = (Width - imageViewW) / 2;
    CGFloat imageViewY = 420;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeTool SG_generateWithColorQRCodeData:string backgroundColor:[CIColor colorWithRed:1 green:0 blue:0.8] mainColor:[CIColor colorWithRed:0.3 green:0.2 blue:0.4]];
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
