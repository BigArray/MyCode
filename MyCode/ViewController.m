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
#import "DrawImageController.h"



@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *nameArray;
@property (nonatomic, strong)NSMutableDictionary *dictionary;

@property (nonatomic, strong)UITextField *searchText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"封装";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    
    NSDictionary *dict = @{@"网络请求":@"0",
                           @"二维码":@"1",
                           @"rsa签名加密解密":@"2",
                           @"银行卡名称":@"3",
                           @"字符串正则判断":@"4",
                           @"过山车动画":@"5",
                           @"数据增删改查":@"6",
                           @"友盟分享":@"7",
                           @"IQKeyboardManager":@"8",
                           @"轮播图":@"9",
                           @"显示gif":@"10",
                           @"手动绘图":@"11"
                           };
    _dictionary = [NSMutableDictionary dictionaryWithDictionary:dict];
    _nameArray = [NSMutableArray arrayWithArray:[_dictionary allKeys]];
    
    
    [self createView];
}

- (void)createView{
    
    _searchText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, Width-60, 40)];
    _searchText.center = CGPointMake(Width/2-30, 84);
    _searchText.borderStyle = 1;
    _searchText.delegate = self;
    _searchText.placeholder = @"搜索";
    
    [self.view addSubview:_searchText];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    searchBtn.frame = CGRectMake(Width-60, 64, 60, 40);
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, Width, Height-104)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
}

- (void)searchBtn{
    [_searchText resignFirstResponder];
    if (!_searchText.text || [_searchText.text isEqualToString:@""]) {
        _nameArray = (NSMutableArray *)[_dictionary allKeys];
        [_tableView reloadData];
        return ;
    }
    
    NSArray *array = [_dictionary allKeys];
    NSString *str = _searchText.text;
    
    NSMutableArray *resultArr = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *nameStr = array[i];
        if ([nameStr containsString:str]) {
            [resultArr addObject:array[i]];
        }
    }
    
    _nameArray = resultArr;
    [_tableView reloadData];
}

#pragma mark - tableview
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
    NSInteger num = [[_dictionary objectForKey:_nameArray[indexPath.row]] integerValue];
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
            break;
        case 11://手动绘图
        {
            DrawImageController *drawVC = [[DrawImageController alloc] init];
            [self.navigationController pushViewController:drawVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - textfield
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
