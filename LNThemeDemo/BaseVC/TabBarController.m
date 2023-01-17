//
//  TabBarController.m
//  GoldUISSFramework
//
//  Created by vvusu on 12/29/16.
//  Copyright © 2016 Micker. All rights reserved.
//

#import "TabBarController.h"
#import "LNTheme.h"

@interface TabBarController ()
@property (weak, nonatomic) IBOutlet UITabBar *lnTabBar;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.lnTabBar.barStyle = UIBarStyleBlack;
    [self setupUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUI) name:LNThemeUpdateCompletedNotification object:nil];

    
}
- (void)setupUI {
    if (@available(iOS 15.0, *)) {
        UITabBarAppearance *tabBarAppearance = [[UITabBarAppearance alloc] init];
        [tabBarAppearance ln_backgroundImageNamed:@"cm2_btm_bg"];
        tabBarAppearance.backgroundEffect = nil;
        tabBarAppearance.shadowColor = UIColor.clearColor;
        [tabBarAppearance setShadowImage:[UIImage new]];
        NSDictionary *textAttributes = @{NSFontAttributeName:[LNTheme fontForType:@"f2"],
                                                                     NSForegroundColorAttributeName:[LNTheme colorForType:@"ctabn"]};
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = textAttributes;
        NSDictionary *textAttributes1 = @{NSFontAttributeName:[LNTheme fontForType:@"f2"],
                               NSForegroundColorAttributeName:[LNTheme colorForType:@"ctabh"]};
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = textAttributes1;
        self.lnTabBar.scrollEdgeAppearance = tabBarAppearance;
        self.lnTabBar.standardAppearance = tabBarAppearance;
    } else {
      // 常规配置方式
        [self.lnTabBar ln_backgroundImageNamed:@"cm2_btm_bg"];
        [self.lnTabBar setShadowImage:[UIImage new]];
    }

    NSArray *normalImages = @[@"cm2_btm_icn_discovery",@"cm2_btm_icn_music",@"cm2_btm_icn_friend",@"cm2_btm_icn_account"];
    NSArray *prsImages = @[@"cm2_btm_icn_discovery_prs",@"cm2_btm_icn_music_prs",@"cm2_btm_icn_friend_prs",@"cm2_btm_icn_account_prs"];
    for (NSInteger i = 0; i < self.lnTabBar.items.count; i++) {
        UITabBarItem *item = self.lnTabBar.items[i];
        item.imageInsets = UIEdgeInsetsMake(0, 0, 30, 0);
//        [item ln_imageInsets:@"NMTabBarBadgeTextViewOriginOffset"];
        [item ln_imageNamed:normalImages[i] renderingMode:UIImageRenderingModeAlwaysOriginal];
        [item ln_selectedImageNamed:prsImages[i] renderingMode:UIImageRenderingModeAlwaysOriginal];
        [item ln_titleTextAttributesColorType:@"ctabn" font:@"f2" forState:UIControlStateNormal];
        [item ln_titleTextAttributesColorType:@"ctabh" font:@"f2" forState:UIControlStateSelected];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 十六进制透明度
 100% — FF
 99% — FC
 98% — FA
 97% — F7
 96% — F5
 95% — F2
 94% — F0
 93% — ED
 92% — EB
 91% — E8
 90% — E6
 89% — E3
 88% — E0
 87% — DE
 86% — DB
 85% — D9
 84% — D6
 83% — D4
 82% — D1
 81% — CF
 80% — CC
 79% — C9
 78% — C7
 77% — C4
 76% — C2
 75% — BF
 74% — BD
 73% — BA
 72% — B8
 71% — B5
 70% — B3
 69% — B0
 68% — AD
 67% — AB
 66% — A8
 65% — A6
 64% — A3
 63% — A1
 62% — 9E
 61% — 9C
 60% — 99
 59% — 96
 58% — 94
 57% — 91
 56% — 8F
 55% — 8C
 54% — 8A
 53% — 87
 52% — 85
 51% — 82
 50% — 80
 49% — 7D
 48% — 7A
 47% — 78
 46% — 75
 45% — 73
 44% — 70
 43% — 6E
 42% — 6B
 41% — 69
 40% — 66
 39% — 63
 38% — 61
 37% — 5E
 36% — 5C
 35% — 59
 34% — 57
 33% — 54
 32% — 52
 31% — 4F
 30% — 4D
 29% — 4A
 28% — 47
 27% — 45
 26% — 42
 25% — 40
 24% — 3D
 23% — 3B
 22% — 38
 21% — 36
 20% — 33
 19% — 30
 18% — 2E
 17% — 2B
 16% — 29
 15% — 26
 14% — 24
 13% — 21
 12% — 1F
 11% — 1C
 10% — 1A
 9% — 17
 8% — 14
 7% — 12
 6% — 0F
 5% — 0D
 4% — 0A
 3% — 08
 2% — 05
 1% — 03
 0% — 00
 */

@end
