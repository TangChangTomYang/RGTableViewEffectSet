//
//  RGTableViewEffectController.m
//  RGTableViewEffectSet
//
//  Created by yangrui on 2019/3/5.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "RGTableViewEffectController.h"
#import "UIView+Extension.h"


typedef enum {
    AnimationType_fadeIn = 0, // 淡入效果
    AnimationType_bounce = 1, // 弹簧效果
    AnimationType_SlideIn = 2, // 侧滑效果
    AnimationType_BounceFadeIn = 3 // 弹簧淡入效果
}AnimationType;
@interface RGTableViewEffectController ()

@property (assign, nonatomic)AnimationType  type;
@end

@implementation RGTableViewEffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (self.type) {
        case AnimationType_fadeIn:{[self fadeInAnimationCell:cell indexPath:indexPath];} break;
        case AnimationType_bounce:{[self bounceAnimationCell:cell indexPath:indexPath];} break;
        case AnimationType_SlideIn:{[self slideInAnimationCell:cell indexPath:indexPath];} break;
        case AnimationType_BounceFadeIn:{[self bounceFadeInAnimationCell:cell indexPath:indexPath];} break;
        default:
            break;
    }
}



/**
 淡入动画
 */
- (IBAction)danRuBtnClick:(id)sender {
    self.type = AnimationType_fadeIn;
    
    [self.tableView reloadData];
    
}

- (IBAction)bounceBtnClick:(id)sender {
    
    self.type = AnimationType_bounce;
    
    [self.tableView reloadData];
}

- (IBAction)ceruBtnClick:(id)sender {
    self.type = AnimationType_SlideIn;
    
    [self.tableView reloadData];
    
}

- (IBAction)bounceDanRuBtnClick:(id)sender {
    
    self.type = AnimationType_BounceFadeIn;
    
    [self.tableView reloadData];
}

-(void)fadeInAnimationCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    
    NSTimeInterval duration = 0.5;
    NSTimeInterval delay = 0.05 * indexPath.row;
    cell.alpha = 0;
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseIn animations:^{
        cell.alpha = 1;
    } completion:nil];
}



-(void)bounceAnimationCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = cell.height;
    cell.transform = CGAffineTransformMakeTranslation(0, rowHeight);
    
    
    NSTimeInterval duration = 0.5;
    NSTimeInterval delay = 0.05 * indexPath.row;
    
    [UIView  animateWithDuration:duration delay:delay usingSpringWithDamping:0.4 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        cell.transform = CGAffineTransformIdentity;
    } completion:nil];
}


-(void)slideInAnimationCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    CGFloat rowWidth = cell.width;
    cell.transform = CGAffineTransformMakeTranslation(rowWidth ,0);
    
    
    NSTimeInterval duration = 0.5;
    NSTimeInterval delay = 0.05 * indexPath.row;
    
    [UIView  animateWithDuration:duration delay:delay usingSpringWithDamping:0.4 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        cell.transform = CGAffineTransformIdentity;
    } completion:nil];
}

-(void)bounceFadeInAnimationCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = cell.height * 0.5;
    cell.transform = CGAffineTransformMakeTranslation(0, rowHeight);
    cell.alpha = 0;
    
    NSTimeInterval duration = 0.5 * 2;
    NSTimeInterval delay = 0.05 * indexPath.row * 2;
    
    [UIView  animateWithDuration:duration delay:delay usingSpringWithDamping:0.4 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        cell.transform = CGAffineTransformIdentity;
        cell.alpha = 1;
    } completion:nil];
}



@end
