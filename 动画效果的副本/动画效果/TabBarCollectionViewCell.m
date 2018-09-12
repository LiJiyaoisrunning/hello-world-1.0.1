//
//  TabBarCollectionViewCell.m
//  动画效果
//
//  Created by lanou on 16/4/27.
//  Copyright © 2016年 God's Door. All rights reserved.
//

#import "TabBarCollectionViewCell.h"

@interface TabBarCollectionViewCell()


@end

@implementation TabBarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.layer.cornerRadius = 15;
        
        UIView *select = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        select.layer.cornerRadius = 15;
        
        select.backgroundColor = [UIColor redColor];
        
//        self.selectedBackgroundView = select;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2.5, 2.5, 25, 25)];
        
//        imageView.image ;
        
        _imageView.layer.cornerRadius = 12.5;
        
//        _imageView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}



@end
