//
//  ContactsViewController.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "ContactsViewController.h"
#import "PersonViewController.h"
@interface ContactsViewController (){
}

@end

@implementation ContactsViewController
@synthesize contactArray;
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
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}


 //---set the title for each section---
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 
     return @"Contacts";
 
 }
 
 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return self.rows;
    return contactArray.count;
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
    
    // Configure the cell...
    cell.textLabel.text=[contactArray objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Set Contacts information
    //For now, statically create info
    PersonViewController *PVC =[[PersonViewController alloc]initWithNibName:@"PersonViewController" bundle:nil];
    PVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:PVC animated:YES completion:nil];
    PVC.nameLabel.text=[contactArray objectAtIndex:indexPath.row];
    PVC.event.text=self.eventTitle.text;
    PVC.phone.text=@"6317462887";
    PVC.email.text=@"student@umass.edu";
    PVC.facebook.text=@"http://facebook.com/djpscarf";
    PVC.twitter.text=@"@LeafInnovators";
    PVC.linkedin.text=@"http://linkedin.com/beSmart";
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
