//
//  PersonViewController.h
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextField *event;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *facebook;
@property (strong, nonatomic) IBOutlet UITextField *twitter;
@property (strong, nonatomic) IBOutlet UITextField *linkedin;

- (IBAction)backAction:(id)sender;
- (IBAction)editAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *editOutlet;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
