//
//  EventsViewController.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "EventsViewController.h"
#import "Contact.h"
#import "ContactsViewController.h"
@interface EventsViewController (){
    NSMutableArray *eventArray;
}

@end

@implementation EventsViewController
@synthesize managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    eventArray=[[NSMutableArray alloc]init];
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
    
    //Fill table with values, we made up just to test
    [self test];
}

-(void)makeData{
    //Create a fetch request and set the entity.
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    //At the end of the current implementation of viewDidLoad, create a sort descriptor to order Event objects by creation date—most recent first—and a mutable array. Add the sort descriptor to the array, and set the array as the fetch request’s sortDescriptors array:
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"event" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    //Having created a fetch request, you now execute it. The events array needs to be mutable, so make a mutable copy of the result.
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        // Handle the error.
        NSLog(@"Error");
    }
    eventArray=mutableFetchResults;
    
    [self.tableView reloadData];
    request=nil;
    entity=nil;
    sortDescriptor=nil;
    sortDescriptors=nil;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


//---set the title for each section---
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return eventArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setBackgroundColor:[UIColor whiteColor]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text=[eventArray objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Create array based event selected
    //for Testing purposes we made a static one
    NSMutableArray *peopleArray = [[NSMutableArray alloc]init];
    [peopleArray addObject:@"John Wilson"];
    [peopleArray addObject:@"Marco Chiang"];
    [peopleArray addObject:@"Nate Tepper"];
    [peopleArray addObject:@"Eli Schiff"];
    [peopleArray addObject:@"Phil Scarfi"];
    [peopleArray addObject:@"Erik Risinger"];
    
    ContactsViewController *CVC =[[ContactsViewController alloc]initWithNibName:@"ContactsViewController" bundle:nil];
    CVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:CVC animated:YES completion:nil];
    CVC.eventTitle.text=[eventArray objectAtIndex:indexPath.row];
    [CVC setContactArray:peopleArray];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}





-(void)test{
    [eventArray addObject:@"Austin JS Meetup"];
    [eventArray addObject:@"Google IO"];
    [eventArray addObject:@"Yale Hackathon"];
    [eventArray addObject:@"UMass Career Fair"];

    [self.tableView reloadData];

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
