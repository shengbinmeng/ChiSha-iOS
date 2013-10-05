//
//  ChoiceListViewController.m
//  ChiSha
//
//  Created by Shengbin Meng on 13-2-27.
//  Copyright (c) 2013年 Peking University. All rights reserved.
//

#import "ChoiceListViewController.h"
#import "ChiShaChoiceManager.h"

@interface ChoiceListViewController ()

@end

@implementation ChoiceListViewController {
    NSMutableArray* choices;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return self;
}


- (void) addChoice
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"输入新的吃啥选项" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    if (buttonIndex == 1) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        if ([textField.text isEqualToString:@"添加新选项..."]) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"我勒个去" message:@"别输入这个字符串啊，搞雷同了程序十分不好办！咱重输吧" delegate:self cancelButtonTitle:@"好吧" otherButtonTitles:nil];
            [alert show];
            return;
        }
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"%@", textField.text] forKey:@"name"];
        [choices insertObject:d atIndex:1];
        NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:1 inSection:0]];
        [[self tableView] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationTop];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    choices = [ChiShaChoiceManager getChoiceList];
    
    self.editButtonItem.title = @"编辑";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillDisappear:(BOOL)animated
{
    if (self.isEditing) {
        [self setEditing:NO animated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    // Make sure you call super first
    [super setEditing:editing animated:animated];
    
    if (editing) {
        self.editButtonItem.title = @"完成";
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"%@", @"添加新选项..."] forKey:@"name"];
        [choices insertObject:d atIndex:0];
        [self.tableView reloadData];
    } else {
        self.editButtonItem.title = @"编辑";
        [choices removeObjectAtIndex:0];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return choices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *choice = [choices objectAtIndex:[indexPath row]];
    // Configure the cell...
    cell.textLabel.text = [choice valueForKey:@"name"];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return self.editing;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [choices removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        [self addChoice];
    }   
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
