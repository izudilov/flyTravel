//
//  DataManager.h
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import <Foundation/Foundation.h>
#import "Countries.h"
#import "Cities.h"
#import "Airports.h"

#define kDataManagerLoadDataIsCompleted @"DataManagerLoadDataDidComplete"

typedef enum DataSourceType {
    DataSourceTypeCountries,
    DataSourceTypeCities,
    DataSourceTypeAirports
} DataSourceType;


@interface DataManager : NSObject

+(instancetype)sharedInstance;

- (void) loadData;

@property (nonatomic, strong, readonly) NSArray *countries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

@end

