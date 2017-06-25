//
//  GIFViewController.m
//  MyCode
//
//  Created by 中付支付 on 2017/6/13.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "GIFViewController.h"

@interface GIFViewController ()

@end

@implementation GIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"gif";
    
    
    [self showGIF];
    
    [self showGIF2];
}

- (void)showGIF{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [webView setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, 150)];
    [self.view addSubview:webView];
    webView.scalesPageToFit = YES;
    webView.scrollView.scrollEnabled = NO;
    
    webView.backgroundColor = [UIColor clearColor];
    webView.opaque = 0;
    
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
}

- (void)showGIF2{//有bug
    NSString *html = @"<img src='test2.gif' width=100% height=free style=\"margin-top:0 margin-bottom:0\"  />";
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:webView];
    [webView setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, 400)];
    
    [webView loadHTMLString:html baseURL:url];
    
    webView.scalesPageToFit = YES;
    webView.scrollView.scrollEnabled = NO;
    
    webView.backgroundColor = [UIColor clearColor];
    webView.opaque = 0;
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
