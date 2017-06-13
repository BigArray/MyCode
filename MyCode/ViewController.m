//
//  ViewController.m
//  MyCode
//
//  Created by 张振飞 on 2017/2/1.
//  Copyright © 2017年 zzf. All rights reserved.
//

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "HttpRequestController.h"
#import "QRcodeController.h"
#import "RSAController.h"
#import "CardNameController.h"
#import "StringRegexController.h"
#import "RollerCoasterController.h"
#import "SqliteController.h"
#import "ShareController.h"
#import "IQKeyboardManagerController.h"
#import "ScrollImagesController.h"
#import "GIFViewController.h"



@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *nameArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"封装";
    
    self.navigationController.navigationBar.translucent = YES;
    
    _nameArray = [[NSMutableArray alloc] initWithObjects:@"网络请求", @"二维码", @"rsa签名加密解密", @"银行卡名称", @"字符串正则判断", @"过山车动画", @"数据增删改查", @"友盟分享", @"IQKeyboardManager", @"轮播图", @"显示gif", nil];
    
    [self createView];
}

- (void)createView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _nameArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger num = indexPath.row;
    //跳转到不同页面
    switch (num) {
        case 0://网络请求
        {
            HttpRequestController *hrVC = [[HttpRequestController alloc] init];
            [self.navigationController pushViewController:hrVC animated:YES];
        }
            
            break;
        case 1://二维码
        {
            QRcodeController *qrVC = [[QRcodeController alloc] init];
            [self.navigationController pushViewController:qrVC animated:YES];
        }
            
            break;
        case 2://rsa
        {
            RSAController *rsaVC = [[RSAController alloc] init];
            [self.navigationController pushViewController:rsaVC animated:YES];
        }
            
            break;
        case 3://银行卡名称
        {
            NSLog(@"--银行卡名称--");
            CardNameController *cnVC = [[CardNameController alloc] init];
            [self.navigationController pushViewController:cnVC animated:YES];
        }
            
            break;
        case 4://字符串正则判断
        {
            StringRegexController *srVC = [[StringRegexController alloc] init];
            [self.navigationController pushViewController:srVC animated:YES];
        }
            break;
        case 5://过山车动画
        {
            RollerCoasterController *rcVC = [[RollerCoasterController alloc] init];
            [self.navigationController pushViewController:rcVC animated:YES];
        }
            break;
        case 6://数据增删改查
        {
            SqliteController *sqlVC = [[SqliteController alloc] init];
            [self.navigationController pushViewController:sqlVC animated:YES];
        }
            break;
        case 7://友盟分享
        {
            ShareController *shareVC = [[ShareController alloc] init];
            [self.navigationController pushViewController:shareVC animated:YES];
        }
            break;
        case 8://IQKeyboardManagerController
        {
            IQKeyboardManagerController *iqVC = [[IQKeyboardManagerController alloc] init];
            [self.navigationController pushViewController:iqVC animated:YES];
        }
            break;
        case 9://轮播图
        {
            ScrollImagesController *scimgVC = [[ScrollImagesController alloc] init];
            [self.navigationController pushViewController:scimgVC animated:YES];
        }
            break;
        case 10://显示gif
        {
            GIFViewController *gifVC = [[GIFViewController alloc] init];
            [self.navigationController pushViewController:gifVC animated:YES];
        }
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
