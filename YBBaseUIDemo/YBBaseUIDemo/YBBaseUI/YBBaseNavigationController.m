//
//  YBBaseNavigationController.m
//  YoubanLoan
//
//  Created by asance on 2017/6/30.
//  Copyright © 2017年 asance. All rights reserved.
//

#import "YBBaseNavigationController.h"
#import "YBBaseViewController.h"
#import "UIColor+HexInt.h"

@implementation YBBaseNavigationController

+ (YBBaseNavigationController *)rootController:(NSString *)vcName{
    
    Class vcClass = NSClassFromString(vcName);
    if(!vcClass){
        vcClass = [YBBaseViewController class];
    }
    YBBaseViewController *viewcontroller = [[vcClass alloc] init];
    
    YBBaseNavigationController *navController = [[YBBaseNavigationController alloc] initWithRootViewController:viewcontroller];
    navController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    navController.navigationItem.backBarButtonItem.title = @"返回";
    navController.navigationBar.translucent = NO;
    navController.navigationBar.barTintColor = [UIColor hexColor:@"0099ff"];
    navController.navigationBar.tintColor = [UIColor whiteColor];
    [navController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [navController.navigationBar setBackgroundImage:[YBBaseNavigationController imageWithColor:[UIColor hexColor:@"0099ff"]] forBarMetrics:UIBarMetricsDefault];
    navController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    return navController;
}
+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
