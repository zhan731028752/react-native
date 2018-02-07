//
//  TestManagerView.m
//  myproj
//
//  Created by mac_Z_P_H on 2018/2/6.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "TestManagerView.h"
#import "DemoView.h"
#import "TestViewController.h"
@interface TestManagerView()
@property (nonatomic) TestViewController *bt;
@end
@implementation TestManagerView
RCT_EXPORT_MODULE(TestManagerView)

RCT_EXPORT_VIEW_PROPERTY(datas, NSArray)
RCT_EXPORT_VIEW_PROPERTY(changeValue, int)
RCT_EXPORT_VIEW_PROPERTY(appKey, NSString)
RCT_EXPORT_VIEW_PROPERTY(shareText, NSString)
RCT_EXPORT_VIEW_PROPERTY(imageName, NSString)
RCT_EXPORT_VIEW_PROPERTY(myTitle, NSString)
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(btImageName, NSString)
RCT_EXPORT_VIEW_PROPERTY(onClickBanner, RCTBubblingEventBlock)
/// 重写这个方法，返回将要提供给JS使用的视图
- (UIView *)view {

  _bt =  [[TestViewController alloc]init];

  return _bt;
}








@end
