//
//  FirstViewController.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController (){
    
}

@end

@implementation FirstViewController

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
    //Check if connected to Pebble
    if(self.connected){
        //Already connected, we need to disconect
        [self.watchDelegate connectToWatch:NO];
    }
    else{
        //Not connected, lets connect!
        [self.watchDelegate connectToWatch:YES];
    }
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
