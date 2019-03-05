//
//  PresentAsPopVer.m
//  RGTableViewEffectSet
//
//  Created by yangrui on 2019/3/5.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "PresentAsPopVer.h"

@interface PresentAsPopVer ()<UIPopoverPresentationControllerDelegate>

@end

@implementation PresentAsPopVer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"PresentAsPopVer"]) {
        UIViewController *popVer = segue.destinationViewController;
        popVer.popoverPresentationController.delegate = self;
    }
}


#pragma mark- UIPopoverPresentationControllerDelegate

/* For iOS8.0, the only supported adaptive presentation styles are UIModalPresentationFullScreen and UIModalPresentationOverFullScreen. */
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return  UIModalPresentationNone;
}
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    [self setAlphaOfBackgroundViews:1];
}


- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController{
    [self setAlphaOfBackgroundViews:0.8];
}



-(void)setAlphaOfBackgroundViews:(CGFloat)alpha {
    UIWindow *statusBarWindow =  [[UIApplication sharedApplication] valueForKey:@"statusBarWindow"];
    statusBarWindow.alpha = alpha;
    self.view.alpha = alpha;
    self.navigationController.navigationBar.alpha = alpha;
    
}


@end
