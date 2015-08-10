//
//  GoalsViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalDetailViewController.h"

@interface GoalDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *textNotes;
@property (weak, nonatomic) IBOutlet UITableView *taskTable;

@end

@implementation GoalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
}

-(void)viewWillDisappear:(BOOL)animated{
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goal"];
    Goal *goal = [GoalController goalWithName:self.navigationItem.title];
    int i =0;
    for (Task *task in goal.tasks) {
        if (i == indexPath.row) {
            cell.textLabel.text = task.name;
        }
        i++;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    for (Goal *goal in [GoalController goals]) {
        if ([goal.name isEqualToString:self.navigationItem.title]) {
            return goal.tasks.count;
        }
    }
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
