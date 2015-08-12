//
//  GoalsViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalDetailViewController.h"
#import "AddGoalViewController.h"

@interface GoalDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *textNotes;
@property (weak, nonatomic) IBOutlet UITableView *taskTable;

@end

@implementation GoalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    self.navigationItem.title = self.goal.name;
    self.image.image = [UIImage imageNamed:@"goals"];
    self.textNotes.text = @"These are my notes \nAren\'t they original!";
    [self.taskTable reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goal"];
    int i =0;
    for (Task *task in self.goal.tasks) {
        if (i == indexPath.row) {
            cell.textLabel.text = task.name;
        }
        i++;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.goal.tasks.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Tasks";
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AddGoalViewController *add = segue.destinationViewController;
    add.goal = self.goal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
