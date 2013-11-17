//
//  ContactsViewController.h
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *contactArray;
- (IBAction)backAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *eventTitle;
@end
