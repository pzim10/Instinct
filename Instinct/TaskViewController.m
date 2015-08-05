//
//  TaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskViewController.h"
#import "GoalController.h"
#import "AddTaskViewController.h"


@interface TaskViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIView *selfView;
@property (nonatomic, strong) NSArray *switches;
@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, strong) NSString *rename;

@property (nonatomic, strong) UIView *animatedView;
@property (nonatomic, strong) UIView *background;
@property (nonatomic, strong) UIButton *cancel;
@property (nonatomic, strong) UIButton *save;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UISwitch *Sunday;
@property (nonatomic, strong) UISwitch *Monday;
@property (nonatomic, strong) UISwitch *Tuesday;
@property (nonatomic, strong) UISwitch *Wednesday;
@property (nonatomic, strong) UISwitch *Thursday;
@property (nonatomic, strong) UISwitch *Friday;
@property (nonatomic, strong) UISwitch *Saturday;

@property (nonatomic, strong) UILabel *Su;
@property (nonatomic, strong) UILabel *M;
@property (nonatomic, strong) UILabel *Tu;
@property (nonatomic, strong) UILabel *W;
@property (nonatomic, strong) UILabel *Th;
@property (nonatomic, strong) UILabel *F;
@property (nonatomic, strong) UILabel *Sa;

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    UITableView *taskTable = [[UITableView alloc] initWithFrame:CGRectMake(20, 70,
                                                                           self.view.frame.size.width - 40,
                                                                           self.view.frame.size.height/2) style:UITableViewStyleGrouped];
    taskTable.dataSource = self;
    taskTable.delegate = self;
    
    UIView *setTasksView = [[UIView alloc] initWithFrame: CGRectMake(20,
                                                                                 taskTable.frame.size.height + 64,
                                                                                 self.view.frame.size.width - 40,
                                                                                 self.view.frame.size.height - taskTable.frame.size.height -124)];
    setTasksView.backgroundColor = [UIColor orangeColor];
    
    // Create pre-set taskLabels
    CGFloat labelWidth = setTasksView.frame.size.width/3 - 20;
    NSArray *setTasks = @[
                          @"Excercise",
                          @"Art",
                          @"Write",
                          @"Sports",
                          @"Code",
                          @"Read",
                          @"Dance",
                          @"Sing",
                          @"Music"
                          ];
    int l = 0;
    for (int i = 1; i <4; i++) {
        for (int j = 1; j<4; j++) {
            UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(j*15 + (j-1)*labelWidth, 15*i + (i-1)*50, labelWidth, 50)];
            
            [button setTitle:setTasks[l] forState:UIControlStateNormal]; l++;
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.titleLabel.numberOfLines = 0;
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            //            button.backgroundColor = [UIColor cyanColor];
            
            [setTasksView addSubview:button];
            [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
    [self.view addSubview:setTasksView];
    //    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height - 80, 100, 30)];
    //    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    //    [button setTitle:@"Task Ideas" forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor blackColor];
    //    [button addTarget:self action:@selector(makeCustomTasksVisible:) forControlEvents:UIControlEventTouchUpInside];
    //
    //    [self.view addSubview:button];
    [self.view addSubview:taskTable];
}

-(void)makeCustomTasksVisible :(UIView *)theView {
//    UIScrollView *setTasksView = [[UIScrollView alloc] initWithFrame: CGRectMake(20,
//                                                                                 theView.frame.size.height/2 + 44,
//                                                                                 theView.frame.size.width - 40,
//                                                                                 theView.frame.size.height - setTasksView.frame.origin.y -84)];
//    setTasksView.backgroundColor = [UIColor orangeColor];
//    
//    // Create pre-set taskLabels
//    CGFloat labelWidth = setTasksView.frame.size.width/3 - 20;
//    NSArray *setTasks = @[
//                          @"excercise",
//                          @"art",
//                          @"write",
//                          @"sports",
//                          @"code",
//                          @"read",
//                          @"dance",
//                          @"sing",
//                          @"music"
//                          ];
//    int l = 0;
//    for (int i = 1; i <4; i++) {
//        for (int j = 1; j<4; j++) {
//            UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(j*15 + (j-1)*labelWidth, 25*i + (i-1)*50, labelWidth, 50)];
//            
//            [button setTitle:setTasks[l] forState:UIControlStateNormal]; l++;
//            button.titleLabel.textAlignment = NSTextAlignmentCenter;
//            button.titleLabel.numberOfLines = 0;
//            button.backgroundColor = [UIColor cyanColor];
//            
//            [setTasksView addSubview:button];
//            [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//            
//        }
//    }
//    [theView addSubview:setTasksView];
}

-(void) buttonTapped: (UIButton *)button {
    NSLog(@"button Tapped");
#warning Auto populating addTask isn't working.
//    UIStoryboard *story = self.storyboard;
//    [story instantiateViewControllerWithIdentifier:NSStringFromClass([AddTaskViewController class])];
//    AddTaskViewController *add = [AddTaskViewController new];
//    add.textField.text = button.titleLabel.text;
//    [self presentViewController:add animated:YES completion:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"taskCell"];
    
    Goals *goal = [Objects sharedObject].goals[indexPath.section];
    
    Task *task = goal.tasks[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", task.name];
    
    UISwitch *mySwitch = [[UISwitch alloc] initWithFrame: CGRectMake(cell.frame.size.width - 40, cell.frame.size.height-37, 0, 0)];
    UILabel *completionLabel = [[UILabel alloc] initWithFrame:CGRectMake(mySwitch.frame.origin.x - 60, 10, 60, 20)];

    //  Will need to be adjusted based off of the task object
    NSArray *timePeriod = @[@"Daily", @"Weekly", @"Custom"];
    completionLabel.text = timePeriod[indexPath.row % 3];
    completionLabel.textColor =[UIColor greenColor];
    
    [cell addSubview:completionLabel];
    [cell addSubview:mySwitch];
    
    tableView.editing = YES;
    
    return cell;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // remove object from task array;
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are you sure you want to delete this task?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//        alert.alertViewStyle = UIAlertViewStyleDefault;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        for (Task *task in [Objects sharedObject].tasks) {
            if ([task.name isEqualToString:[NSString stringWithFormat:@"%@", cell.textLabel.text]]) {
                Goals *goal = [GoalController goalWithName:task.goalName];
                NSMutableArray *newArray = [goal.tasks mutableCopy];
                [newArray removeObject:task];
                goal.tasks = newArray;
#warning This is causing my app to crash when I have 2 tasks for the same goal created and try to delete 1
                [[Objects sharedObject].tasks removeObject:task];
                [self viewWillAppear:YES];
            }
        }
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action2, NSIndexPath *indexPath) {
//         get correct object and update it

        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [self animateTableCellForEditing:cell fromTableView:tableView];
    }];
    for (int i =0; i < [tableView numberOfSections]; i++) {
        if ([tableView numberOfRowsInSection:i] == 1) {
            return @[action, action2];
        }
    }
    return @[action2];
}

-(void) animateTableCellForEditing: (UITableViewCell *) cell fromTableView:(UITableView *)tableView {
//    self.animatedView = [[UIView alloc] initWithFrame:CGRectMake(cell.frame.size.width/2, cell.frame.origin.y + 20, self.view.frame.size.width/4 - 10, 40)];
    
    self.background = [[UIView alloc] initWithFrame:tableView.bounds];
    self.cancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
    self.save = [[UIButton alloc] initWithFrame:CGRectMake(tableView.frame.size.width - 80, 10, 60, 30)];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 60, tableView.frame.size.width - 20, 40)];
    
    self.textField.placeholder = @"Rename...";
    self.textField.backgroundColor = [UIColor whiteColor];
    
    [self.cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.save setTitle:@"Save" forState:UIControlStateNormal];
    [self.save setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.cancel addTarget:self action:@selector(cancelTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.save addTarget:self action:@selector(saveTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.background.alpha = 0;
    self.background.backgroundColor = [UIColor blackColor];
    
    [tableView addSubview:self.background];
    [self.background addSubview:self.textField];
    [self.background addSubview:self.cancel];
    [self.background addSubview:self.save];
    
//    self.animatedView.backgroundColor = [UIColor lightTextColor];
//    self.animatedView.alpha = .2;
//    [tableView addSubview:self.animatedView];
    
    [UIView animateWithDuration:.35 animations:^{
//        CGAffineTransform transform = CGAffineTransformMakeScale(4.0, 5.0);
        
//        self.animatedView.center = CGPointMake(tableView.center.x - 20, tableView.center.y - 50);
//        self.animatedView.alpha = 1.0;
        self.background.alpha = 1.0;
        
//        self.animatedView.transform = transform;
    } completion:^(BOOL finished) {
    }];
    
   // Instantiate Switches
    self.Sunday = [UISwitch new];
    self.Monday = [UISwitch new];
    self.Tuesday = [UISwitch new];
    self.Wednesday = [UISwitch new];
    self.Thursday = [UISwitch new];
    self.Friday = [UISwitch new];
    self.Saturday = [UISwitch new];
    // Instantiate Labels
    self.Su = [UILabel new]; self.Su.text = @"Su";
    self.M = [UILabel new]; self.M.text = @"M";
    self.Tu = [UILabel new]; self.Tu.text = @"Tu";
    self.W = [UILabel new]; self.W.text = @"W";
    self.Th = [UILabel new]; self.Th.text = @"Th";
    self.F = [UILabel new]; self.F.text = @"F";
    self.Sa = [UILabel new]; self.Sa.text = @"Sa";
    
    NSMutableArray *switches = [NSMutableArray arrayWithObjects:self.Sunday, self.Monday, self.Tuesday, self.Wednesday, self.Thursday, self.Friday, self.Saturday, nil];
    self.switches = switches;
    NSMutableArray *labels = [NSMutableArray arrayWithObjects:self.Su, self.M, self.Tu, self.W, self.Th, self.F, self.Sa, nil];
    self.labels = labels;

    int i =0;
    int j =0;
    for (UILabel *label in self.labels) {
        label.frame = CGRectMake(20 + 100 *i, 150 + 55*j, 30, 30);
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.background addSubview:label];
        i++;
        if (i /3.0 == 1.0) {
            j++;
            i = 0;
        } if (j == 2) {
            i = 1;
        }
    }
    
    i =0;
    j =0;
    for (UISwitch *switch2 in self.switches) {
        switch2.frame = CGRectMake(60 + 100*i, 150 + 55 *j, 45, 45);
        [self.background addSubview:switch2];
        i++;
        if (i /3.0 == 1.0) {
            j++;
            i = 0;
        } if (j == 2) {
            i = 1;
        }
    }
    
    Task *task = [TaskController getTaskWithName:cell.textLabel.text];
    self.rename = task.name;
    
    for (int i =0; i < self.switches.count; i++) {
        UISwitch *switch2 = task.daysToPerfomTask[i];
        if (switch2.on == YES) {
            UISwitch *switch3 = self.switches[i];
            switch3.on = YES;
        }
    }
}

-(void)saveTapped: (UIView *)theView {
    if ([self.textField.text isEqualToString:@""]) {
        Task *task = [TaskController getTaskWithName:self.rename];
        task.daysToPerfomTask = self.switches;
    } else {
        Task *task = [TaskController getTaskWithName:self.rename];
        [TaskController renameTask:task newName:self.textField.text];
        task.daysToPerfomTask = self.switches;
    }
    
    self.background.hidden = YES;
    [self viewWillAppear:YES];
}

-(void)cancelTapped {
    self.background.hidden = YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{return YES;}

//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{return YES;}

//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            Goals *goal = [Objects sharedObject].goals[0];
            return goal.name;
        }
            break;
        case 1:{
            Goals *goal = [Objects sharedObject].goals[1];
            return goal.name;
        }
            break;
        case 2:{
            Goals *goal = [Objects sharedObject].goals[2];
            return goal.name;
        }
            break;
        case 3:{
            Goals *goal = [Objects sharedObject].goals[3];
            return goal.name;
        }
            break;
            
        default:
            return @"";
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            Goals *goal = [Objects sharedObject].goals[0];
            return goal.tasks.count;
        }
            break;
        case 1:{
            Goals *goal = [Objects sharedObject].goals[1];
            return goal.tasks.count;
        }
            break;
        case 2:{
            Goals *goal = [Objects sharedObject].goals[2];
            return goal.tasks.count;
        }
            break;
        case 3:{
            Goals *goal = [Objects sharedObject].goals[3];
            return goal.tasks.count;
        }
            break;
            
        default:
            return 1;
            break;
    }
    // return number of tasks for each goal
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [Objects sharedObject].goals.count;
    // return number of goals
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
