//
//  FirstViewController.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "FirstViewController.h"
#import "EventsViewController.h"
@interface FirstViewController (){
    
}

@end

@implementation FirstViewController
@synthesize connectOutlet;

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
    self.connected=NO;
}


- (IBAction)connectAction:(id)sender {
    if (self.watchDelegate==nil) {
        self.watchDelegate = [[WatchDelegate alloc] init];
        [self.watchDelegate setButton:self.connectOutlet];
    }
    //Check if connected to Pebble
    if([self.connectOutlet.titleLabel.text isEqualToString:@"Disconnect"]){
        //Already connected, we need to disconect
        [self.watchDelegate connectToWatch:NO];
        self.watchDelegate=nil;
    }
    else{
        //Not connected, lets connect!
        NSLog(@"No");
        [self.watchDelegate connectToWatch:YES];

    }
    
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)contactsAction:(id)sender {
    EventsViewController  *EVC = [[EventsViewController alloc]initWithNibName:@"EventsViewController" bundle:nil];
    EVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:EVC animated:YES completion:nil];
    
}

- (IBAction)settingsAction:(id)sender {
}
@end
