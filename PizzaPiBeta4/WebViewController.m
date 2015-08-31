//
//  WebViewController.m
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/9/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "WebViewController.h"
#import "Color.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = self.pizzeria;
    self.navigationController.navigationBar.barTintColor = [Color pizzaRed];

    self.bottomView.backgroundColor = [Color pizzaRed];
}
- (IBAction)onBackButtonTapped:(id)sender {
    [self.webView goBack];

}

- (IBAction)onForwardButtonTapped:(id)sender {
    [self.webView goForward];
}

- (IBAction)onRefreshTapped:(id)sender {
    [self.webView reload];
}



@end
