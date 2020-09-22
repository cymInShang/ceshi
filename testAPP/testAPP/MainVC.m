//
//  MainVC.m
//  testAPP
//
//  Created by 常永梅 on 2020/9/15.
//  Copyright © 2020 测试. All rights reserved.
//

#import "MainVC.h"
#import "TableEditingShareVC.h"

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *flagArray;
    NSMutableArray *aryrow;
    UITableView *tableShare;
}
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    flagArray  = [[NSMutableArray alloc] initWithObjects:@"0",@"0", nil];
    aryrow = [[NSMutableArray alloc] initWithObjects:@[@"1",@"2",@"3"],@[@"4",@"5"], nil];
    
    // UITableView
    tableShare = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-90) style:UITableViewStyleGrouped];
    tableShare.delegate = self;
    tableShare.dataSource = self;
//    tableShare.editing = YES;
    [self.view addSubview:tableShare];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return aryrow.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[aryrow objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([flagArray[indexPath.section] isEqualToString:@"0"])
        return 0;
    else
        return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mainCellIdentifier = @"mainCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainCellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [NSString stringWithFormat:@"cell:%ld",(long)indexPath.row];
    
    return cell;
}
/*// 可编辑
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [aryrow[indexPath.section] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];//删除行
    }//插入操作
    else if (editingStyle == UITableViewCellEditingStyleInsert){
        [aryrow insertObject:@"测试" atIndex:indexPath.section];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
// 可移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}*/
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *viewbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    viewbg.tag = 100+section;
    
    UILabel *labsection = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    labsection.text = [NSString stringWithFormat:@"section%ld",(long)section];
    [viewbg addSubview:labsection];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [viewbg addGestureRecognizer:tap];
    return viewbg;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableEditingShareVC *tbvc = [TableEditingShareVC new];
    [self.navigationController pushViewController:tbvc animated:YES];
}

#pragma mark - click
-(void)sectionClick:(UITapGestureRecognizer *)sender{
    int index = sender.view.tag % 100;
    //展开
    if ([flagArray[index] isEqualToString:@"0"]) {
        flagArray[index] = @"1";
    } else { //收起
        flagArray[index] = @"0";
    }
    
     NSRange range = NSMakeRange(index, 1);
     NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
     [tableShare reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
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
