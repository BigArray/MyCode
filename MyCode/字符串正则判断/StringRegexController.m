//
//  StringRegexController.m
//  MyCode
//
//  Created by 中付支付 on 2017/5/23.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "StringRegexController.h"
#import "NSString+RegexJudge.h"

@interface StringRegexController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation StringRegexController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)phoneNum:(id)sender {
    if ([_textField.text isEqualToString:@""]) {
        _resultLabel.text = @"请输入...";
    } else {
        if ([_textField.text isValidPhoneNum]) {
            _resultLabel.text = @"正确";
        } else{
            _resultLabel.text = @"错误";
        }
    }
}

- (IBAction)identifierNum:(id)sender {
    if ([_textField.text isEqualToString:@""]) {
        _resultLabel.text = @"请输入...";
    } else {
        if ([_textField.text isValidIdCardNum]) {
            _resultLabel.text = @"正确";
        } else{
            _resultLabel.text = @"错误";
        }
    }
}

- (IBAction)email:(id)sender {
    if ([_textField.text isEqualToString:@""]) {
        _resultLabel.text = @"请输入...";
    } else {
        if ([_textField.text isValidEmail]) {
            _resultLabel.text = @"正确";
        } else{
            _resultLabel.text = @"错误";
        }
    }
}

- (IBAction)ipNum:(id)sender {
    if ([_textField.text isEqualToString:@""]) {
        _resultLabel.text = @"请输入...";
    } else {
        if ([_textField.text isValidIP]) {
            _resultLabel.text = @"正确";
        } else{
            _resultLabel.text = @"错误";
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
