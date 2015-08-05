//
//  GoalsViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalsViewController.h"

@interface GoalsViewController () <UITextFieldDelegate>

@property (nonatomic, weak) UIView *selfView;
@property (nonatomic, strong) NSString *goalTitle;
@property (nonatomic, strong) UIButton *addGoal;

@property (nonatomic, strong) UILabel *addLabel;
@property (nonatomic, strong) UITextField *createGoal;
@property (nonatomic, strong) UIButton *save;
@property (nonatomic, strong) UIButton *cancel;

@end

@implementation GoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    CGFloat bottom = 70;
    // add scrollView and set bounds
    int i = 0;
    for (Goals *goal in [Objects sharedObject].goals) {
        if ([goal.name isEqualToString:@""]) {
            // Don't do anything
        } else {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150, 70 +45*i, 300, 30)];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = [NSString stringWithFormat:@"%@", goal.name];
            label.font = [UIFont fontWithName:@"Optima-ExtraBlack" size:25];
            label.textColor = [UIColor orangeColor];
            [self.view addSubview:label];
            bottom = label.frame.origin.y + 45;
            i++;
        }
    }
    self.addGoal = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, bottom, 100, 50)];
    //    addGoal.backgroundColor = [UIColor cyanColor];
    [self.addGoal setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.addGoal.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.addGoal setTitle:@"Add Goal" forState:UIControlStateNormal];
    
    [self.addGoal addTarget:self action:@selector(addGoalTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    bottom += 65;
    
    UIImageView *goalPicture = [[UIImageView alloc] initWithFrame: CGRectMake(20, bottom, self.view.frame.size.width - 40, self.view.frame.size.height - bottom - 52)];
    goalPicture.image = [UIImage imageNamed:@"goals.jpg"];
    [self.view addSubview:self.addGoal];
    [self.view addSubview:goalPicture];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.addGoal.hidden = YES;
}

-(void)addGoalTapped: (UIButton *)button{
    self.addGoal.hidden = YES;
    self.addLabel =[[UILabel alloc] initWithFrame:button.frame];
    self.addLabel.backgroundColor = [UIColor darkGrayColor];
    self.addLabel.alpha = 0;
    self.createGoal = [[UITextField alloc] initWithFrame:button.frame];
    self.createGoal.alpha = .2;
    self.createGoal.placeholder = @"Name your Goal";
    
    self.save = [[UIButton alloc] initWithFrame:CGRectMake(90, button.frame.origin.y + 60, 75, 30)];
    self.cancel = [[UIButton alloc] initWithFrame:CGRectMake(200, button.frame.origin.y + 60, 75, 30)];
    
    [self.save setTitle:@"Save" forState:UIControlStateNormal];
    [self.cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    
    self.save.backgroundColor = [UIColor greenColor];
    self.cancel.backgroundColor = [UIColor redColor];
    
    self.save.alpha = 0;
    self.cancel.alpha = 0;
    
    [self.view addSubview:self.addLabel];
    [self.view addSubview:self.createGoal];
    [self.view addSubview:self.save];
    [self.view addSubview:self.cancel];
    
    
    [UIView animateWithDuration:.3 animations:^{
        self.save.alpha = 1;
        self.cancel.alpha = 1;
        self.createGoal.alpha = 1;
        self.addLabel.alpha = .5;
        
        self.addLabel.center = CGPointMake(self.addLabel.center.x, self.addLabel.center.y + 25);
        
        CGAffineTransform transform = CGAffineTransformMakeScale(3.0, 1.0);
        self.createGoal.transform = transform;
        
        transform = CGAffineTransformMakeScale(3.0, 2.0);
        self.addLabel.transform = transform;
        
    } completion:^(BOOL finished) {
        NSLog(@"Finished");
    }];
    
    [self.save addTarget:self action:@selector(saveTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.cancel addTarget:self action:@selector(cancelTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.createGoal addTarget:self action:@selector(updateName:) forControlEvents:UIControlEventEditingChanged];
    
    self.goalTitle = self.createGoal.text;
}

-(void)saveTapped {
    for (Goals *goal in [Objects sharedObject].goals) {
        if ([goal.name isEqualToString:self.goalTitle]) {
            return;
        }
    }
    if ([self.goalTitle isEqualToString:@""]) {
        NSLog(@"goal needs to have a title");
    } else {
        [GoalController createGoal:self.goalTitle];
    }
    self.goalTitle = @"";
    
    self.save.hidden = YES;
    self.cancel.hidden = YES;
    self.addLabel.hidden = YES;
    self.createGoal.hidden =YES;
    self.addGoal.hidden = YES;
    [self viewWillAppear:YES];
}

-(void)cancelTapped {
    NSLog(@"Cancel Tapped");
    self.save.hidden = YES;
    self.cancel.hidden = YES;
    self.addLabel.hidden = YES;
    self.createGoal.hidden =YES;
    self.addGoal.hidden = NO;

}

-(void)updateName : (UITextField *)name{
    self.goalTitle = name.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
