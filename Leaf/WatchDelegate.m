//
//  WatchDelegate.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "WatchDelegate.h"
#import "AppDelegate.h"
@interface WatchDelegate(){
    PBPebbleCentral *pebbleCentral;
     PBWatch *connectedWatch;
    AppDelegate *appDelegate;

}
@end

@implementation WatchDelegate

-(id)init{
    self = [super init];
    if (self) {
//       [[PBPebbleCentral defaultCentral] setDelegate:self];
        pebbleCentral = [PBPebbleCentral defaultCentral];
        NSArray *connectedWatches = [pebbleCentral connectedWatches];
        NSLog(@"%@", connectedWatches);
        uuid_t myAppUUIDbytes;
        NSUUID *myAppUUID = [[NSUUID alloc] initWithUUIDString:@"39b9d7d5-87b1-4950-a41e-1219fc1bfdf4"];
        [myAppUUID getUUIDBytes:myAppUUIDbytes];
        
        [pebbleCentral setAppUUID:[NSData dataWithBytes:myAppUUIDbytes length:16]];
        [pebbleCentral setDelegate:self];
        }
    
    return self;
}

-(void)watchDidOpenSession:(PBWatch *)watch{
    NSLog(@"watch did open session");
    
    [self.button setTitle:@"Disconnect" forState:UIControlStateNormal];
    
}

-(void)watch:(PBWatch *)watch handleError:(NSError *)error{
    NSLog(@"got error");
}

-(void)connectToWatch:(BOOL)connect{
    connectedWatch = [pebbleCentral lastConnectedWatch];
    [connectedWatch setDelegate:self];
    pebbleCentral.delegate=self;
    if (connect) {
        //Connect
       
        
        
        [connectedWatch appMessagesGetIsSupported:^(PBWatch *watch, BOOL isAppMessagesSupported) {
            if (isAppMessagesSupported) {
                NSLog(@"This Pebble supports app message!");
                [self sendMessage:@"Connected!! Wooh!"];
            }
            else {
                NSLog(@":( - This Pebble does not support app message!");
            }
        }];
        
    }
    else{
        //Close the session
        [connectedWatch closeSession:nil];
        [self.button setTitle:@"Connect" forState:UIControlStateNormal];
    }
}
//This method takes in a string, and will send it to the Pebble Watch
-(void)sendMessage:(NSString *)string{
    NSNumber *key = @(0);
    [connectedWatch appMessagesPushUpdate:[NSDictionary dictionaryWithObject:string forKey:key] onSent:^(PBWatch *watch, NSDictionary *update, NSError *error){
        if (!error) {
            NSLog(@"sent message");
            
        }
        else{
            NSLog(@"got error %@", error);
        }
    }];
    
}

- (void)pebbleCentral:(PBPebbleCentral*)central watchDidConnect:(PBWatch*)watch isNew:(BOOL)isNew {
    NSLog(@"Pebble connected!: %@", [watch name]);
    connectedWatch = watch;
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.FVC.connected=YES;
    [appDelegate.FVC.connectOutlet setTitle:@"Disconnect" forState:UIControlStateNormal];
    
    
}

- (void)pebbleCentral:(PBPebbleCentral*)central watchDidDisconnect:(PBWatch*)watch {
    NSLog(@"Pebble disconnected: %@", [watch name]);
    
    if (connectedWatch == watch || [watch isEqual:connectedWatch]) {
        connectedWatch = nil;
    }
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.FVC.connected=NO;
    [appDelegate.FVC.connectOutlet setTitle:@"Connect" forState:UIControlStateNormal];
}

@end
