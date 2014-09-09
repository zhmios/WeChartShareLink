//
//  RootViewController.m
//  WeChartShareLink
//
//  Created by user on 14-9-9.
//  Copyright (c) 2014年 jianguo. All rights reserved.
//

#import "RootViewController.h"
#import "WXApi.h"

@interface RootViewController ()
@property (nonatomic, strong) UIAlertView *alertView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self creatUI];
    [self linkShare];
}

- (void)creatUI{
    self.view.backgroundColor = [UIColor colorWithRed:0.20 green:0.83 blue:0.93 alpha:1.0];
    self.navigationItem.title = @"微信link分享";
    [self.view addSubview:[self titleLabel]];
    [self.view addSubview:[self userImageView]];
    [self.view addSubview:self.alertView];
}
- (UILabel *)titleLabel{

    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 60)];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    title.text = @"微信link分享尚未封装,集成其中的两项功能:1.分享给好友 2.分享到朋友圈";
    title.textColor = [UIColor blackColor];
    title.numberOfLines = 0;
    return title;
}
- (UIImageView *)userImageView{

    UIImageView *userImageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 2- 60, self.view.bounds.size.height / 2- 70, 120, 120)];
    [userImageview setImage:[UIImage imageNamed:@"image"]];
    if (self.view.bounds.size.height > 480) {
        
        userImageview.frame = CGRectMake(self.view.bounds.size.width / 2- 60, self.view.bounds.size.height / 2- 120, 120, 120);
    }
    return userImageview;
}
- (UIAlertView *)alertView{
    
    if (!_alertView) {
        
        self.alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"亲,你没有按照微信哦" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
    }
    
    return _alertView;
}

- (void)linkShare{

    NSArray *nameArr = @[@"分享给好友",@"分享到朋友圈"];
    for (int i = 0; i< 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:[nameArr objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = i;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(i * 130 + 20, 300, 130, 60)];
        [btn addTarget:self action:@selector(sendLinkContent:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    

}

- (void)sendLinkContent:(id)sender{
    
    BOOL isinstall = [WXApi isWXAppInstalled];
    if (isinstall) {
        UIButton *btn = (UIButton *)sender;
        if (btn.tag == 0) {
            
            [self.sendMesgDelegate changeScene: WXSceneSession];
            
        }else{
            
            [self.sendMesgDelegate changeScene:WXSceneTimeline];
            
        }
        if (self.sendMesgDelegate) {
            
            [self.sendMesgDelegate sendLinkContent];
        }
        
    }else{
        
        [self.alertView show];
        
    }
   
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
