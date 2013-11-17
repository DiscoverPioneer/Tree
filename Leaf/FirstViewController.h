//
//  FirstViewController.h
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WatchDelegate.h"
@interface FirstViewController : UIViewController

- (IBAction)connectAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *connectOutlet;
@property (strong, nonatomic) WatchDelegate *watchDelegate;
@property BOOL connected;
- (IBAction)contactsAction:(id)sender;
- (IBAction)settingsAction:(id)sender;

@end
