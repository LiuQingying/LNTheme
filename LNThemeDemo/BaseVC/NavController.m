//
//  NavController.m
//  GoldUISSFramework
//
//  Created by vvusu on 12/30/16.
//  Copyright © 2016 Micker. All rights reserved.
//

#import "NavController.h"
#import <LNTheme/LNTheme.h>

@interface NavController ()

@end

@implementation NavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUI) name:LNThemeUpdateCompletedNotification object:nil];


}
- (void)setupUI {
    //设置主题颜色
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [navBar ln_titleTextAttributesColorType:@"ctabh" font:@"f4"];
    [navBar ln_backgroundImageNamed:@"cm2_topbar_bg" forBarMetrics:UIBarMetricsDefault];

    [self setValue:navBar forKey:@"navigationBar"];
    //自定义返回按钮
    UIImage *backButtonImage = [[LNTheme imageNamed:@"cm2_topbar_icn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (@available(iOS 13.0, *)) {
        NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};

        UINavigationBarAppearance *barApp = [UINavigationBarAppearance new];
        [barApp configureWithOpaqueBackground];
        [barApp ln_backgroundImageNamed:@"cm2_topbar_bg"];
        [barApp setBackIndicatorImage:backButtonImage transitionMaskImage:backButtonImage];
       barApp.backgroundEffect = nil;
       barApp.shadowColor = [UIColor whiteColor];
//        标题文字颜色
        barApp.titleTextAttributes = dic;
       self.navigationBar.scrollEdgeAppearance = barApp;
       self.navigationBar.standardAppearance = barApp;
        UISearchBar.appearance.tintColor = [UIColor whiteColor];

    }else {
        UINavigationBar.appearance.backIndicatorImage = [UIImage new];
        UINavigationBar.appearance.backIndicatorTransitionMaskImage = [UIImage new];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [navBar ln_backgroundImageNamed:@"cm2_topbar_bg" forBarMetrics:UIBarMetricsDefault];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillLayoutSubviews {

}
@end
