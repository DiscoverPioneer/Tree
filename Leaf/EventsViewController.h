//
//  EventsViewController.h
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
- (IBAction)backAction:(id)sender;
@end
