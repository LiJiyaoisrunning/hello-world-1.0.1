//
//  myTabBarViewController.h
//  动画效果
//
//  Created by lanou on 16/4/27.
//  Copyright © 2016年 God's Door. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTabBarViewController : UITabBarController

@property (nonatomic, strong)NSMutableArray *leftArray;
@property (nonatomic, strong)NSMutableArray *rightArray;
@property (nonatomic, strong)UIImage *currentImage;

@end

@interface UIViewController(myTabBarViewController)

@property (nonatomic, assign)BOOL isSelected;

@end