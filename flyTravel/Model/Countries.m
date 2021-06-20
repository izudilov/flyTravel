//
//  Countries.m
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import "Countries.h"

@implementation Countries

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        self.name = [dictionary valueForKey: @"name"];
        self.currency = [dictionary valueForKey: @"currency"];
        self.translations = [dictionary valueForKey: @"name_translations"];
        self.code = [dictionary valueForKey: @"code"];
    }
    
    return self;
}

@end
