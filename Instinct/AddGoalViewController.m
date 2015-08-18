//
//  AddGoalViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/8/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddGoalViewController.h"
#import "GoalsViewController.h"

static NSString *const placeHolder= @"Add notes about this goal here";

@interface AddGoalViewController () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *visualGoal;
@property (weak, nonatomic) IBOutlet UILabel *textCount;
@property (nonatomic, strong) NSString *maxLength;
@property (nonatomic, assign) BOOL firstTouch;
@property (weak, nonatomic) IBOutlet UIButton *goalIdeas;
@property (weak, nonatomic) IBOutlet UILabel *goalIdeaslabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddGoalViewController

- (IBAction)saveTapped:(id)sender {
    if ([self.nameField.text isEqualToString:@""]) {
        // Goal can't exist without a name
        return;
    }else if (self.goal){
        // goal is being edited
        self.goal.name = self.nameField.text;               // Edit goal name
        self.goal.notes = self.notesText.text;              // Edit goal notes
        if (self.imageName) {
            // IF the image has changed
            self.goal.visualGoalPath = self.imageName;
            NSData *image = UIImageJPEGRepresentation(self.visualGoal.image, .8);
            [image writeToFile:[GoalController pathToFile:self.imageName] atomically:YES];
        }
        [GoalController save];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    } else if (self.taskName){
        // A special goal is being created
        Goal *check = [GoalController goalWithName:self.nameField.text];
        if (check) {
            // can't create two goals with the same name
            return;
        } else {
            // Create special goal
            [GoalController createGoalWithTitleNotesAndImage:self.nameField.text notes:self.notesText.text imageNamed:self.imageName];
            if (self.imageName) {
                // If an image was selected from the imagePicker, save it to file
                NSData *image = UIImageJPEGRepresentation(self.visualGoal.image, .8);
                [image writeToFile:[GoalController pathToFile:self.imageName] atomically:YES];
            }
            
            // Create the goals pre-defined tasks here
            NSArray *days = @[@0, @0, @0, @0, @0, @0,@0];
            self.taskName = [NSString stringWithFormat:@"%@ %@", self.taskName, self.nameField.text];
            [TaskController createTaskWtihNameAndDaysOrDeadline:self.taskName arrayOfDays:days deadline:nil];
            
            // assign that task to the goal that was just created
            for (Goal *goal in [GoalController goals]) {
                if ([goal.name isEqualToString:self.nameField.text]) {
                    for (Task *task in [TaskController tasks]) {
                        if ([task.name isEqualToString:self.taskName]) {
                            [GoalController addTasktoGoal:task forGoal:goal];
                            break;
                        }
                    }
                }
            }
        }
        if (self.firstGoal) {
            [self.navigationController pushViewController:[GoalsViewController new] animated:YES];
        } else {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    } else if (self.firstGoal) {
        // This creates the first goal only
        [GoalController createGoalWithTitleNotesAndImage:self.nameField.text notes:self.notesText.text imageNamed:self.imageName];
        if (self.imageName) {
            // if an image was selected from the imagePicker, save it to file
            NSData *image = UIImageJPEGRepresentation(self.visualGoal.image, .8);
            [image writeToFile:[GoalController pathToFile:self.imageName] atomically:YES];
        }
        [self.navigationController pushViewController:[GoalsViewController new] animated:YES];
   
    } else {
        // No editing, create a new custom goal
        Goal *check = [GoalController goalWithName:self.goal.name];
        if (check) {
            // Can't create two goals with the same name
            self.goal.name = self.name;
        } else {
            // If the name isn't take then create a new goal with that name
            [GoalController createGoalWithTitleNotesAndImage:self.nameField.text notes:self.notesText.text imageNamed:self.imageName];
            if (self.imageName) {
            // if an image was selected from the imagePicker, save it to file
                NSData *image = UIImageJPEGRepresentation(self.visualGoal.image, .8);
                [image writeToFile:[GoalController pathToFile:self.imageName] atomically:YES];
            }
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)cameraTapped:(id)sender {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel"destructiveButtonTitle:nil otherButtonTitles:@"Take New Picture", @"Choose From Library", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [popupQuery showInView:self.view];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1) {
        
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        picker.allowsEditing=TRUE;
        [self.navigationController presentViewController:picker animated:YES completion:nil];
        
    } else if (buttonIndex == 0) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController * picker = [UIImagePickerController new];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.allowsEditing=TRUE;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
        }
        else {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Can not find Camera Device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Assing the image thumbnail to the selected image
    self.visualGoal.image = image;
    // Name the image for use in writing to file
    self.imageName = [NSString stringWithFormat:@"%@Test", self.nameField.text];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTouch = FALSE;
    self.maxLength = @"";
    self.notesText.textColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
    if (self.goal) {
        // Goal is being edited
        self.goalIdeas.hidden = YES;
        self.goalIdeaslabel.hidden = YES;
        
        self.nameField.text = self.goal.name;
        self.name = self.goal.name;
        self.maxLength = self.goal.notes;
        self.firstTouch = TRUE;
        self.notesText.text = self.goal.notes;
        self.notesText.textColor = [UIColor blackColor];
        
        if (self.goal.visualGoalPath) {
            // If an image is associated with this Goal then load that image here
            self.visualGoal.image = [UIImage imageWithContentsOfFile:[GoalController pathToFile:self.goal.visualGoalPath]];
        }
   
    } else {
        // Default add Goal screen
        self.name = @"";
        self.nameField.text = @"";
    }
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraTapped:)];
    self.navigationItem.rightBarButtonItems = @[self.saveButton, barButton];
}
- (IBAction)nameChanged:(id)sender {
    self.name = self.nameField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textViewDidChangeSelection:(UITextView *)textView{
    if (!self.firstTouch) {
        // Clear the text if this is the first time editing in the textView
        self.notesText.text = @"";
        self.firstTouch = TRUE;
    } else if (self.notesText.text.length == 0) {
        self.notesText.text = placeHolder;
        self.notesText.textColor = [UIColor lightGrayColor];
        self.maxLength = @"";
        self.firstTouch = FALSE;
        self.textCount.text = @"0/180";
    } else if (self.maxLength.length <= 179) {
        // Update label within restraints
        self.notesText.textColor = [UIColor blackColor];
        self.textCount.text = [NSString stringWithFormat:@"%lu/180", (unsigned long)self.notesText.text.length];
        self.maxLength = self.notesText.text;
    }else if (self.maxLength.length == 180 && self.notesText.text.length < 180){
        // Allow deleting at text count limit
        self.maxLength = self.notesText.text;
        self.textCount.text = [NSString stringWithFormat:@"%lu/180", (unsigned long)self.notesText.text.length];// notesText is the textView
        self.textCount.textColor = [UIColor blackColor];
    }else {
        // Disallow adding at text count limit
        self.notesText.text = [self.notesText.text substringToIndex:180];
        self.maxLength = self.notesText.text;
        self.textCount.textColor = [UIColor redColor];
    }
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
