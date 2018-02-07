//
//  TestViewController.h
//  myproj
//
//  Created by mac_Z_P_H on 2018/2/7.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
@interface TestViewController : UIView
@property(nonatomic,strong)NSArray *datas;
@property(nonatomic,assign)int changeValue;
@property (nonatomic, copy) RCTBubblingEventBlock onClickBanner;
@end
