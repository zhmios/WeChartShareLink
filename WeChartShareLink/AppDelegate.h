//
//  AppDelegate.h
//  WeChartShareLink
//
//  Created by user on 14-9-9.
//  Copyright (c) 2014年 jianguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "RootViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate,WXApiDelegate,sendMesgDelegate>
{
    
enum WXScene _scene;
    
}

@property (strong, nonatomic) UIWindow *window;


@end

