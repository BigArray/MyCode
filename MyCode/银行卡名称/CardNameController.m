//
//  CardNameController.m
//  MyCode
//
//  Created by 张振飞 on 2017/5/21.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "CardNameController.h"

@interface CardNameController ()
@property (strong, nonatomic) IBOutlet UITextField *cardNum;
@property (strong, nonatomic) IBOutlet UILabel *cardName;
@property (weak, nonatomic) IBOutlet UIImageView *bankLogo;

@end

@implementation CardNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)confirmBtn:(id)sender {
    _cardName.text = [self returnBankName:_cardNum.text];
    NSArray *arr = [_cardName.text componentsSeparatedByString:@"·"];
    
    //图片不全 啦啦啦
    if (arr) {
        _bankLogo.image = [UIImage imageNamed:arr[0]];
    }
}

- (NSString *)returnBankName:(NSString*) idCard{
    
    if (!idCard || [idCard isEqualToString:@""]) {
        return @"请输入卡号";
    }
    
    if(idCard.length<16 || idCard.length>19){
        
        return @"卡号不合法";
    }
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"bank" ofType:@"plist"];
    NSDictionary* resultDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSArray *bankBin = resultDic.allKeys;
    
    //6位Bin号
    NSString* cardbin_6 = [idCard substringWithRange:NSMakeRange(0, 6)];
    //8位Bin号
    NSString* cardbin_8 = [idCard substringWithRange:NSMakeRange(0, 8)];
    
    
    if ([bankBin containsObject:cardbin_6]) {
        return [resultDic objectForKey:cardbin_6];
    }else if ([bankBin containsObject:cardbin_8]){
        return [resultDic objectForKey:cardbin_8];
    }else{
        return @"文件中不存在请自行添加对应卡种";
    }
    return @"";
    
    
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
