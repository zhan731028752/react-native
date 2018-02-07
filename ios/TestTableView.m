//
//  TestTableView.m
//  myproj
//
//  Created by mac_Z_P_H on 2018/2/6.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "TestTableView.h"
#import "ZTLetterIndex.h"
#define kScreenWidth ([[UIScreen mainScreen]bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen]bounds].size.height)

@interface TestTableView()<UITableViewDelegate,UITableViewDataSource,ZTLetterIndexDelegate>
@end
@implementation TestTableView
{
  NSMutableArray *_dataSource;
  NSArray *_resName;
   NSMutableArray *_letterArray;
  ZTLetterIndex  *_letterIndex;
  BOOL _isClick;
  
}
-(NSArray *)datas{
  
  if (_datas==nil) {
    _datas = [NSArray array];
  }
  return _datas;
}


-(instancetype)initWithFrame:(CGRect)frame{
  if (self=[super initWithFrame:frame]) {
    self.dataSource =self;
    self.delegate =self;
    
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
    [self addSubview:_letterIndex];
  }
  
  return self;
}

#pragma mark - ZTLetterIndexDelegate
- (void)ZTLetterIndex:(ZTLetterIndex *)indexView didSelectedItemWithIndex:(NSInteger)index
{
  _isClick = YES;
  [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)ZTLetterIndex:(ZTLetterIndex *)indexView beginChangeItemWithIndex:(NSInteger)index
{
  [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)ZTLetterIndex:(ZTLetterIndex *)indexView endChangeItemWithIndex:(NSInteger)index
{
  [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)ZTLetterIndex:(ZTLetterIndex *)indexView isChangingItemWithIndex:(NSInteger)index
{
  [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
     return _dataSource.count;
  
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
  
  NSString *value = self.datas[indexPath.row%2];
  cell.textLabel.text = value;
  return cell;
  
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  NSLog(@"%zd",indexPath.row);
}

-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{



     return _letterArray[section];

}

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
//
//  NSString *key = [_resName objectAtIndex:index];
//  NSLog(@"sectionForSectionIndexTitle key=%@",key);
//  if (key == UITableViewIndexSearch) {
//    [tableView setContentOffset:CGPointZero animated:NO];
//    return NSNotFound;
//  }
//
//  NSLog(@"%zd",index);
//  return index;
//}
//
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//
//  NSArray *resName = @[@"热",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
//  _resName = resName;
//  return resName;
//}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  if (_isClick) {
    return;
  }
  NSIndexPath *indexPath = [self indexPathForRowAtPoint:scrollView.contentOffset];
  [_letterIndex selectIndex:indexPath.section];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  _isClick = NO;
}


@end
