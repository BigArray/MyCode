//
//  RSAController.m
//  MyCode
//
//  Created by 张振飞 on 2017/5/22.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "RSAController.h"
#import "RSAHandler.h"

@interface RSAController ()

@property (nonatomic, strong)RSAHandler *handler;
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *signLabel;
@property (weak, nonatomic) IBOutlet UILabel *unSignLable;
@property (weak, nonatomic) IBOutlet UILabel *ecryptLable;
@property (weak, nonatomic) IBOutlet UILabel *decryptLabel;

@end

@implementation RSAController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

#warning attention please
    //使用时要把 enable bitCode 设置为NO
    
    
    [self initHandler];
}

#pragma mark 初始化handler
- (void) initHandler{
    NSString* private_key_string = @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBALgv/syFH337KzC29KvR0p6cP+glRqjDYAQno5ifafXZjgf1EhBjZblKv+HiLAzNBOlYU1PnLuOOkZj6pg1A5HUZLpsbYa5Mwr1bUHALjXLaB3THCpZX51/b5L14erGo52Jv/j/63YljEtMm8ALmkY8S+3fPxFeY7ya+2VXMEtplAgMBAAECgYAguvauZWGpQ37zUy+7cLfa061PlYAu8TkYw+qAbqOnupdQtq4VF3S2LqBWhZiKVcxvovB70nM0oNsisjfb1xJBpyfDBFug7d+y2f8yr6aTOezoY5DBYEF3Svg9Kp9ra+vvAYX/7fh+tHCU0HOvp0z8ikZiRSWZaQ+3A2GiCIJrwQJBAPKVji89hGAMEWLJJFZaPiLBqZUwR2W/rp7Ely5ddKfjcosHhggHfOb71BnrMOm0h4S85Gx6a87n9R2To0c51q0CQQDCX6yYdt/9JGORyNSXfzMfSZyVOrMpIo77R0YwKa3UOwwLA56l2Lc4AYO10/lyAyZCKse2/5D9ZZUB7xoYEmGZAkB8MEJVPuoY/bSc3RqENrjetERsAwZaObJcx4oaC3AgTxmhwV1FmQfBfKTODBDDZE+Ijedm/ZlZmHhtBtstKJgVAkBKma/DgHRtUscIT90QHBjB3F3FhJb4pbPcyzksCQMXXmY73/LG0ktXqnUjlyy4zm6jnIm0OZgrOQ6chGkubfeZAkBMCGF2tPfEJh8XODOvlw5ADnUiq+Qe/abcpKowkiT9zP+rYT9XJAx7QxChjdwTZb6ahnJY1+ny1emEHUOs2fm8";
    
    NSString* public_key_string = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4L/7MhR99+yswtvSr0dKenD/oJUaow2AEJ6OYn2n12Y4H9RIQY2W5Sr/h4iwMzQTpWFNT5y7jjpGY+qYNQOR1GS6bG2GuTMK9W1BwC41y2gd0xwqWV+df2+S9eHqxqOdib/4/+t2JYxLTJvAC5pGPEvt3z8RXmO8mvtlVzBLaZQIDAQAB";
    
    //证书倒入
//    NSString *publicKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_public_key.pem" ofType:nil];
//    NSString *privateKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_private_key.pem" ofType:nil];
    
    RSAHandler* handler = [RSAHandler new];
    // [handler importKeyWithType:KeyTypePublic andPath:publicKeyFilePath];
    //[handler importKeyWithType:KeyTypePrivate andPath:privateKeyFilePath];
    [handler importKeyWithType:KeyTypePrivate andkeyString:private_key_string];
    [handler importKeyWithType:KeyTypePublic andkeyString:public_key_string];
    _handler = handler;

}

- (IBAction)sha1Sign:(id)sender {
    if (![_inputText.text isEqualToString:@""]) {
        _signLabel.text = [_handler signString:_inputText.text];
    }
}
- (IBAction)verifySha1Sing:(id)sender {
    _unSignLable.text = [_handler verifyString:_inputText.text withSign:_signLabel.text] ? @"成功":@"失败";
}

- (IBAction)encrypt:(id)sender {
    _ecryptLable.text = [_handler encryptWithPriviteKey:_inputText.text];
}

- (IBAction)decrypt:(id)sender {
    _decryptLabel.text = [_handler decryptWithPublicKey:_ecryptLable.text];
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
