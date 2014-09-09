//
//  RootViewController.h
//  WeChartShareLink
//
//  Created by user on 14-9-9.
//  Copyright (c) 2014年 jianguo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol sendMesgDelegate<NSObject>

- (void) changeScene:(NSInteger)scene;
- (void)sendLinkContent;

@end

@interface RootViewController : UIViewController
@property (nonatomic,assign) id<sendMesgDelegate>sendMesgDelegate;

@end
