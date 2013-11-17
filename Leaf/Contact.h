//
//  Contact.h
//  Leaf
//
//  Created by Phil Scarfi on 11/17/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * event;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSString * facebook;
@property (nonatomic, retain) NSString * linkedin;
@property (nonatomic, retain) NSString * email;

@end
