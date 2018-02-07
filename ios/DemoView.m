//
//  TestView.m
//  myproj
//
//  Created by mac_Z_P_H on 2018/2/6.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "DemoView.h"

@interface DemoView()
@property (weak, nonatomic) UIView *testView;
@end
@implementation DemoView
- (void)setColor:(UIColor *)color{
  self.backgroundColor =color;
}

-(void)setShareText:(NSString *)shareText{
  _shareText =shareText;
  [self setTitle:shareText forState:UIControlStateNormal];
}


-(instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside] ;
  }
      return self;
}
-(void)click{
  NSLog(@"99999");
}

@end
