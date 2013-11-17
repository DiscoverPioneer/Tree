//
//  WatchDelegate.h
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PebbleKit/PebbleKit.h>
@interface WatchDelegate : NSObject <PBPebbleCentralDelegate, PBWatchDelegate>

-(void)connectToWatch:(BOOL)connect;
-(void)watchDidOpenSession:(PBWatch *)watch;
-(void)watch:(PBWatch *)watch handleError:(NSError *)error;

@end