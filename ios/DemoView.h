//
//  TestView.h
//  myproj
//
//  Created by mac_Z_P_H on 2018/2/6.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
@interface DemoView : UIButton

@property (nonatomic, copy) NSString * appKey;//友盟appkey
@property (nonatomic, copy) NSString * shareText;//分享的文本
@property (nonatomic, copy) NSString * imageName;//分享的图片
@property (nonatomic, copy) NSString * myTitle;//分享按钮标题
@property (nonatomic) UIColor * color;//按钮标题字体颜色
@property (nonatomic, copy) NSString * btImageName;//分享按钮图片


@end
