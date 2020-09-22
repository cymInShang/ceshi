//
//  TableEditingShareVC.m
//  testAPP
//
//  Created by 常永梅 on 2020/9/16.
//  Copyright © 2020 测试. All rights reserved.
//

#import "TableEditingShareVC.h"

@interface TableEditingShareVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *TbEditing;

@end

@implementation TableEditingShareVC

- (void)viewDidLoad {

    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc] initWithObjects:@"上海",@"浙江",@"江苏",@"广州",@"深圳", nil];
    self.TbEditing.delegate = self;
    self.TbEditing.dataSource = self;
    self.TbEditing.editing = YES;  //设置可编辑
}
#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[dataArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - table editing
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0 ){
        return UITableViewCellEditingStyleInsert;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
}
// 代理方法，实现后可以进行增加单元行或者删除单元行
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //当样式是删除操作，进行删除
    if (editingStyle == UITableViewCellEditingStyleDelete){
        //删除数组中一行
        [dataArray removeObjectAtIndex:indexPath.row];
//        [self.TbEditing deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];//只刷新删除行部分（性能更好一些）
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert){
        [dataArray insertObject:@"我是新增" atIndex:indexPath.row];
//        [self.TbEditing insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    [self.TbEditing reloadData];
    
}

//实现此方法，就可以移动单元格， 方法里面是让数据和样式移动保持一致
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSLog(@"移动了”");
    dataArray[destinationIndexPath.row] = dataArray[sourceIndexPath.row];
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
