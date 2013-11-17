//
//  WatchDelegate.m
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "WatchDelegate.h"

@interface WatchDelegate(){
     PBWatch *connectedWatch;
}
@end

@implementation WatchDelegate



-(void)connectToWatch:(BOOL)connect{
    if (connect) {
        //Connect
        connectedWatch = [[PBPebbleCentral defaultCentral] lastConnectedWatch];
    }
    else{
        [connectedWatch closeSession:nil];
    }
    
}


- (void)pebbleCentral:(PBPebbleCentral*)central watchDidConnect:(PBWatch*)watch isNew:(BOOL)isNew {
    NSLog(@"Pebble connected: %@", [watch name]);
    connectedWatch = watch;
}

- (void)pebbleCentral:(PBPebbleCentral*)central watchDidDisconnect:(PBWatch*)watch {
    NSLog(@"Pebble disconnected: %@", [watch name]);
    
    if (connectedWatch == watch || [watch isEqual:connectedWatch]) {
        connectedWatch = nil;
    }
}

@end
