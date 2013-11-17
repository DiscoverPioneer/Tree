//
//  PersonViewController.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController (){
    NSMutableArray *textFields;
}

@end

@implementation PersonViewController

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
    textFields= [[NSMutableArray alloc]initWithObjects:_nameLabel,_event,_phone,_email,_facebook,_twitter,_linkedin,nil];
    //ScrollView
    // set the content size to be the size our our whole frame
    self.scrollView.contentSize = CGSizeMake(320, 800);
    // then set frame to be the size of the view's frame
    self.scrollView.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    // now add our scroll view to the main view
    [self.view addSubview:self.scrollView];
    self.scrollView.scrollEnabled=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//Text Field Delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)editAction:(id)sender {
    if([self.editOutlet.titleLabel.text isEqualToString:@"Edit"]){
        [self.editOutlet setTitle:@"Done" forState:UIControlStateNormal];
        self.scrollView.scrollEnabled=YES;

        for (UITextField *textField in textFields)
            textField.userInteractionEnabled=YES;
    }
        else{
            [self.editOutlet setTitle:@"Edit" forState:UIControlStateNormal];
            for (UITextField *textField in textFields)
                textField.userInteractionEnabled=NO;
            //Scroll to top, and disable scroll
            [self.scrollView setContentOffset:CGPointZero animated:YES];
            self.scrollView.scrollEnabled=NO;


        }
}
@end
