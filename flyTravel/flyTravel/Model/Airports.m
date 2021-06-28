//
//  Airports.m
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import "Airports.h"

@implementation Airports


- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        self.name = [dictionary valueForKey: @"name"];
        self.translations = [dictionary valueForKey: @"name_translations"];
        self.code = [dictionary valueForKey: @"code"];
        self.timeZone = [dictionary valueForKey: @"time_zone"];
        self.countryCode = [dictionary valueForKey: @"country_code"];
        self.cityCode = [dictionary valueForKey: @"city_code"];
        self.flightable = [dictionary valueForKey: @"flightable"];
        
        NSDictionary *coords = [dictionary valueForKey: @"coordinates"];
        if (coords && ![coords isEqual: [NSNull null]]) {
            NSNumber *lon = [coords valueForKey: @"lon"];
            NSNumber *lat = [coords valueForKey: @"lat"];
            
            if (![lon isEqual: [NSNull null]] && ![lat isEqual: [NSNull null]]) {
                self.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
            }
            
        }
    }
    
    return self;
}

@end
