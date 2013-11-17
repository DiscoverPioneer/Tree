//
//  FirstViewController.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController (){
    BOOL connected;
    
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
    connected=NO;
}




- (IBAction)connectAction:(id)sender {
    //Check if connected to Pebble
    if(connected){
        //Already connected, we need to disconect
        
        //Upon Success, Change the button title to "Connect"
        [self.connectOutlet setTitle:@"Connect" forState:UIControlStateNormal];

    }
    else{
        //Not connected, lets connect!
        
        //Upon Success, Change the button title to "Disconnect"
        [self.connectOutlet setTitle:@"Disconnect" forState:UIControlStateNormal];
    }
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
