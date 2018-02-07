//
//  TestViewController.m
//  myproj
//
//  Created by mac_Z_P_H on 2018/2/7.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "TestViewController.h"
#import "ZTLetterIndex.h"

#define kScreenWidth ([[UIScreen mainScreen]bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen]bounds].size.height)

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource,ZTLetterIndexDelegate>
@property(nonatomic,strong)UITableView *tableview;
@end
@implementation TestViewController
{
  NSMutableArray *_dataSource;
  NSArray *_resName;
  NSMutableArray *_letterArray;
  ZTLetterIndex  *_letterIndex;
  BOOL _isClick;
  
}
//-(NSArray *)datas{
//
//  if (_datas==nil) {
//    _datas = [NSArray array];
//  }
//  return _datas;
//}

-(instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self addSubview:table];
    _tableview = table;
    table.dataSource =self;
    table.delegate =self;
    _isClick = NO;
    _dataSource = [NSMutableArray array];
    for (int i = 0; i < 26; ++i) {
      NSMutableArray *temp = [NSMutableArray array];
      for (int i = 0; i < arc4random()%5+3; ++i) {
        [temp addObject:[NSString stringWithFormat:@"%d",arc4random()%10000]];
      }
      [_dataSource addObject:temp];
    }
    
    _letterArray = [NSMutableArray array];
    for (char c='A';c<='Z';c++) {
      [_letterArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    
    _letterIndex = [[ZTLetterIndex alloc] initWithFrame:CGRectMake(kScreenWidth-20, (kScreenHeight - 16*25 - 40)/2, 12, 16*25 + 40 + 8)];
    _letterIndex.dataArray = _letterArray; //在其他用于展示的属性赋值之后赋值
    _letterIndex.delegate = self;
    
    _letterIndex.selectedTextColor = [UIColor redColor];
    _letterIndex.sliderColor = [UIColor redColor];
    [self addSubview:_letterIndex];
    
  }
  return self;
}


#pragma mark - ZTLetterIndexDelegate
- (void)ZTLetterIndex:(ZTLetterIndex *)indexView didSelectedItemWithIndex:(NSInteger)index
{
  _isClick = YES;
  [_tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)ZTLetterIndex:(ZTLetterIndex *)indexView beginChangeItemWithIndex:(NSInteger)index
{
  [_tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)ZTLetterIndex:(ZTLetterIndex *)indexView endChangeItemWithIndex:(NSInteger)index
{
  [_tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)ZTLetterIndex:(ZTLetterIndex *)indexView isChangingItemWithIndex:(NSInteger)index
{
  [_tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
  
  NSLog(@"%@-----",self.datas);
  return [_dataSource[section] count];
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
  return _dataSource.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *identifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  cell.selectionStyle  = UITableViewCellSelectionStyleNone;
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
  }
  cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
  
  return cell;
  
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%zd",self.changeValue);
  
  for (NSString *title in self.datas) {
     NSLog(@"%@-----",title);
  }
  self.onClickBanner(@{@"name":@"zph",@"age":@"18",@"hight":@"178"});

}



-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
  
  return _letterArray[section];
  
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  if (_isClick) {
    return;
  }
  NSIndexPath *indexPath = [_tableview indexPathForRowAtPoint:scrollView.contentOffset];
  [_letterIndex selectIndex:indexPath.section];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  _isClick = NO;
}


@end
