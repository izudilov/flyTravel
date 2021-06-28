//
//  Airports.h
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Airports : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *translations;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *timeZone;
@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, strong) NSString *cityCode;
@property (nonatomic, getter = isFlightable) BOOL flightable;
@property (nonatomic) CLLocationCoordinate2D coordinate;

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
