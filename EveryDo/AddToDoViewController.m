//
//  AddToDoViewController.m
//  EveryDo
//
//  Created by Suvan Ramani on 2016-11-15.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController () <UITextFieldDelegate>

@property (nonatomic, strong) ToDo *todoItem;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard:)];
    
    [self.view addGestureRecognizer:self.tapGR];
    
    self.todoItem = [[ToDo alloc] init];
    
    self.titleTextField.tag = 1;
    self.descriptionTextField.tag = 2;
    self.priorityTextField.tag = 3;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveNewTodo:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}


#pragma mark - Textfield Delegate saving Todo properties


-(void)dissmissKeyboard:(UITapGestureRecognizer *)tapGR {
    [self.view endEditing:YES];
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField.tag == 1) {
        self.todoItem.title = textField.text;
    } else if (textField.tag == 2) {
        self.todoItem.todoDescription = textField.text;
    } else if (textField.tag == 3) {
        self.todoItem.priorityNumber = [textField.text intValue];
    }
}


#pragma mark - post new todo with NSNC


-(void)saveNewTodo:(id)saveButton {
    
    NSNotificationCenter *nCentre = [NSNotificationCenter defaultCenter];
    
    NSDictionary *userTodoItem = @{@"newTodoItem" : self.todoItem};
    
    NSNotification *notification = [[NSNotification alloc] initWithName:@"newTodo" object:nil userInfo:userTodoItem];
    
    [nCentre postNotification:notification];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
