//
//  AddToDoViewController.m
//  EveryDo
//
//  Created by Suvan Ramani on 2016-11-15.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

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
}


-(void)dissmissKeyboard:(UITapGestureRecognizer *)tapGR {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
