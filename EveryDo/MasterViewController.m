//
//  MasterViewController.m
//  EveryDo
//
//  Created by Suvan Ramani on 2016-11-15.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"
#import "AddToDoViewController.h"

@interface MasterViewController ()

@property NSMutableArray *listOfToDos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    NSNotificationCenter *nCentre = [NSNotificationCenter defaultCenter];
    
    [nCentre addObserver:self selector:@selector(insertNewTodo:) name:@"newTodo" object:nil];
    
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.listOfToDos) {
        self.listOfToDos = [[NSMutableArray alloc] init];
    }
    [self performSegueWithIdentifier:@"createNewTodo" sender:self];
    
    
//    [self.listOfToDos insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


-(void)insertNewTodo:(NSNotification *)notification {
    ToDo *itemToAdd = [notification.userInfo objectForKey:@"newTodoItem"];
    
    [self.listOfToDos addObject:itemToAdd];
    [self.tableView reloadData];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *selectedToDo = self.listOfToDos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:selectedToDo];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listOfToDos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];

    ToDo *currentToDo = self.listOfToDos[indexPath.row];
    
    NSString *displayString = [NSString stringWithFormat:@"%@", currentToDo.title];
    
    cell.todoTiltleLabel.text = displayString;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listOfToDos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


#pragma mark - Create Todos

-(void)createTodos {
    
    ToDo *todo1 = [[ToDo alloc] init];
    todo1.title = @"Buy milk";
    todo1.todoDescription = @"Go to safeway on boradway and MacDonald and buy 2%% milk";
    todo1.priorityNumber = 3;
    
    [self.listOfToDos addObject:todo1];
    
    ToDo *todo2 = [[ToDo alloc] init];
    todo2.title = @"Take out trash";
    todo2.todoDescription = @"Take out trash and put in a new garbage bag";
    todo2.priorityNumber = 2;
    
    [self.listOfToDos addObject:todo2];
    
    ToDo *todo3 = [[ToDo alloc] init];
    todo3.title = @"Laundry";
    todo3.todoDescription = @"Take laundry to laundry room for washing and drying";
    todo3.priorityNumber = 1;
    
    [self.listOfToDos addObject:todo3];
}

@end
