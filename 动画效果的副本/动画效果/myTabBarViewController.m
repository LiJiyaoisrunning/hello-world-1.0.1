//
//  myTabBarViewController.m
//  动画效果
//
//  Created by lanou on 16/4/27.
//  Copyright © 2016年 God's Door. All rights reserved.
//

#import "myTabBarViewController.h"
#import "TabBarCollectionViewCell.h"
@interface myTabBarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *buttonCollectionLeft;
@property (nonatomic, strong)UICollectionView *buttonCollectionRight;
@property (nonatomic, assign)BOOL isOpened;
@property (nonatomic, strong)UIButton *button;

@end

@implementation myTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isOpened = NO;
    
    self.tabBar.frame = CGRectMake((414-50)/2, 736-50, 50, 50);
    self.tabBar.layer.cornerRadius = 25;
    self.tabBar.clipsToBounds = YES;
    self.tabBar.barTintColor = [UIColor colorWithRed:160/255.0 green:143/255.0 blue:153/255.0 alpha:1];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    _button.frame = CGRectMake(5, 5, 40, 40);
//    _button.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.8 alpha:1];
    _button.layer.cornerRadius = 20;
    [self.tabBar addSubview:_button];
    [_button addTarget:self action:@selector(showButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UICollectionViewFlowLayout *FlowLayoutLeft = [[UICollectionViewFlowLayout alloc] init];
    FlowLayoutLeft.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.buttonCollectionLeft = [[UICollectionView alloc] initWithFrame:CGRectMake(414/2+10, 736-45, 0, 40)collectionViewLayout:FlowLayoutLeft];
    _buttonCollectionLeft.backgroundColor = [UIColor colorWithRed:182/255.0 green:185/255.0 blue:196/255.0 alpha:1];
    _buttonCollectionLeft.layer.cornerRadius = 20;
    
    _buttonCollectionLeft.delegate = self;
    _buttonCollectionLeft.dataSource = self;
    
    [self.view insertSubview:_buttonCollectionLeft belowSubview:self.tabBar];
    
    [_buttonCollectionLeft registerClass:[TabBarCollectionViewCell class] forCellWithReuseIdentifier:@"LeftCell"];
    
    UICollectionViewFlowLayout *FlowLayoutRight = [[UICollectionViewFlowLayout alloc] init];
    FlowLayoutRight.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.buttonCollectionRight = [[UICollectionView alloc] initWithFrame:CGRectMake(414/2-25+10, 736-45, 0, 40)collectionViewLayout:FlowLayoutRight];
    _buttonCollectionRight.backgroundColor = [UIColor colorWithRed:182/255.0 green:185/255.0 blue:196/255.0 alpha:1];
    _buttonCollectionRight.layer.cornerRadius = 20;
    
    _buttonCollectionRight.delegate = self;
    _buttonCollectionRight.dataSource = self;
    
    [self.view insertSubview:_buttonCollectionRight belowSubview:self.tabBar];
    
    [_buttonCollectionRight registerClass:[TabBarCollectionViewCell class] forCellWithReuseIdentifier:@"RightCell"];
    
//    [UICollectionView appearance]
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_button setBackgroundImage:_currentImage forState:UIControlStateNormal];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    CAPropertyAnimation *animation = (CAPropertyAnimation *)anim;
//    
//    if ([animation.keyPath isEqualToString:@"transform.rotation.y"]) {
//        if (_isOpened == YES) {
//            
//            [_button setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
//        } else {
//            [_button setBackgroundImage:nil forState:UIControlStateNormal];
//        }
//    }
}

- (void)animationDidStart:(CAAnimation *)anim{
    CAPropertyAnimation *animation = (CAPropertyAnimation *)anim;
    
    if ([animation.keyPath isEqualToString:@"transform.rotation.y"]) {
        if (_isOpened == YES) {
            
            [_button setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
        } else {
            
            [_button setBackgroundImage:_currentImage forState:UIControlStateNormal];
        }
    }//else if ([animation.keyPath isEqualToString:@"bounds.size"]){
//        if (_isOpened == YES) {
//            _buttonCollectionLeft.frame = CGRectMake(414/2+10, 736-45, (50+5*4+30*3), 40);
//            _buttonCollectionRight.frame = CGRectMake(414/2-25+10, 736-45, (50+5*4+30*3), 40);
//        } else {
//            _buttonCollectionLeft.frame = CGRectMake(414/2, 736-45, 0, 40);
//            _buttonCollectionRight.frame = CGRectMake(414/2-25+10, 736-45, 0, 40);
//        }
//
//    }

}

- (void)buttonRotation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    // 设置最终值
    animation.toValue = [NSNumber numberWithFloat:M_PI * 10];
    // 设置动画时间
    animation.duration = 1;
    // 设置动画的次数
    animation.repeatCount = 1;
    
    animation.delegate = self;
    
    [_button.layer addAnimation:animation forKey:nil];
}

- (void)showButtonAction:(UIButton *)btn{
    
    [self buttonRotation];
    
    if (_isOpened == NO) {
//        CABasicAnimation *LeftOpenAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
//        LeftOpenAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 40)];
//        LeftOpenAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(-(50+5*4+30*3), 40)];
//        LeftOpenAnimation.duration = 1;
//        LeftOpenAnimation.delegate = self;
//        [_buttonCollectionLeft.layer addAnimation:LeftOpenAnimation forKey:nil];
//        
//        CABasicAnimation *RightOpenAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
//        RightOpenAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 40)];
//        RightOpenAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake((50+5*4+30*3), 40)];
//        RightOpenAnimation.duration = 1;
//        RightOpenAnimation.delegate = self;
//        [_buttonCollectionRight.layer addAnimation:RightOpenAnimation forKey:nil];

        [UIView animateWithDuration:1 animations:^{
            _buttonCollectionLeft.frame = CGRectMake(414/2+10, 736-45, -(50+5*4+30*3), 40);
            _buttonCollectionRight.frame = CGRectMake(414/2-25+10, 736-45, (50+5*4+30*3), 40);
        }];
        
    } else {
//        CABasicAnimation *LeftOpenAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
//        LeftOpenAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(-(50+5*4+30*3), 40)];
//        LeftOpenAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0, 40)];
//        LeftOpenAnimation.duration = 1;
//        LeftOpenAnimation.delegate = self;
//        [_buttonCollectionLeft.layer addAnimation:LeftOpenAnimation forKey:nil];
//        
//        CABasicAnimation *RightOpenAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
//        RightOpenAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake((50+5*4+30*3), 40)];
//        RightOpenAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0, 40)];
//        RightOpenAnimation.duration = 1;
//        RightOpenAnimation.delegate = self;
//        [_buttonCollectionRight.layer addAnimation:RightOpenAnimation forKey:nil];

        [UIView animateWithDuration:1 animations:^{
            _buttonCollectionLeft.frame = CGRectMake(414/2, 736-45, 0, 40);
            _buttonCollectionRight.frame = CGRectMake(414/2-25+10, 736-45, 0, 40);
        }];
    }
    _isOpened = !_isOpened;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _buttonCollectionLeft) {
        TabBarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LeftCell" forIndexPath:indexPath];
        
        UIImage *image = _leftArray[indexPath.row];
        
        cell.imageView.image = image;
        
        return cell;
    } else {
        TabBarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCell" forIndexPath:indexPath];
        
        UIImage *image = _rightArray[indexPath.row];
        
        cell.imageView.image = image;
        
        return cell;
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(30, 30);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (collectionView == _buttonCollectionLeft) {
        return UIEdgeInsetsMake(5, 5, 5, 55);
    } else {
        return UIEdgeInsetsMake(5, 45, 5, 5);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for (UICollectionViewCell *cell in _buttonCollectionRight.visibleCells) {
        cell.contentView.backgroundColor = [UIColor clearColor];
        
        //            cell.selected = NO;
    }

    for (UICollectionViewCell *cell in _buttonCollectionLeft.visibleCells) {
        cell.contentView.backgroundColor = [UIColor clearColor];
    }

    if (collectionView == _buttonCollectionRight) {
        self.currentImage = _rightArray[indexPath.row];
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor blueColor];
            } else {
        self.currentImage = _leftArray[indexPath.row];

        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor blueColor];
        
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
