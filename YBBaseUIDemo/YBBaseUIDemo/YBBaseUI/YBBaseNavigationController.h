//
//  YBBaseNavigationController.h
//  YoubanLoan
//
//  Created by asance on 2017/6/30.
//  Copyright © 2017年 asance. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YBBaseNavigationControllerDelegate;

@interface YBBaseNavigationController : UINavigationController
@property(weak, nonatomic) id<YBBaseNavigationControllerDelegate> myDelegate;
/**return YBBaseNavigationController instance by specified viewcontroller*/
+ (YBBaseNavigationController *)rootController:(NSString *)vcName;
@end

@protocol YBBaseNavigationControllerDelegate <NSObject>
/**should callback when viewcontroller will disappear*/
- (void)navigationControllerWillDisappear;
@end
