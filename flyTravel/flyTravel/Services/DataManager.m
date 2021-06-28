//
//  DataManager.m
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import "DataManager.h"
#import "Countries.h"
#import "Cities.h"
#import "Airports.h"

@interface DataManager()
    @property (nonatomic, strong) NSArray *countriesArray;
    @property (nonatomic, strong) NSArray *citiesArray;
    @property (nonatomic, strong) NSArray *airportsArray;
@end

@implementation DataManager

+(instancetype)sharedInstance {
    static DataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataManager alloc] init];
    });
    
    return  instance;
}

- (NSMutableArray *) createObjectsFromArray: (NSArray *) array withType: (DataSourceType) type {
    NSMutableArray *results = [NSMutableArray new];
    for (NSDictionary *jsonObject in array) {
        if (type == DataSourceTypeCountries) {
            Countries *countries = [[Countries alloc] initWithDictionary: jsonObject];
            [results addObject: countries];
        }
        if (type == DataSourceTypeCities) {
            Cities *cities = [[Cities alloc] initWithDictionary: jsonObject];
            [results addObject: cities];
        }
        if (type == DataSourceTypeAirports) {
            Airports *airports = [[Airports alloc] initWithDictionary: jsonObject];
            [results addObject: airports];
        }
    }
    return results;
}

- (void) loadData {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSArray *countriesJSON = [self arrayFromFileName: @"countries" ofType: @"json"];
        self -> _countriesArray = [self createObjectsFromArray: countriesJSON withType: DataSourceTypeCountries];
        
        NSArray *citiesJSON = [self arrayFromFileName: @"cities" ofType: @"json"];
        self -> _citiesArray = [self createObjectsFromArray: citiesJSON withType: DataSourceTypeCities];
        
        NSArray *airportsJSON = [self arrayFromFileName: @"airports" ofType: @"json"];
        self -> _airportsArray = [self createObjectsFromArray: airportsJSON withType: DataSourceTypeAirports];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kDataManagerLoadDataIsCompleted object: nil];
        });
        
        NSLog(@"Load data is completed");
    });
}

- (NSArray *) arrayFromFileName: (NSString *) fileName ofType: (NSString *) type {
    NSString *path = [[NSBundle mainBundle] pathForResource: fileName ofType: type];
    NSData *data = [NSData dataWithContentsOfFile: path];
    return [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
}

- (NSArray *) countries {
    return _countriesArray;
}

- (NSArray *) cities {
    return _citiesArray;
}

- (NSArray *) airports {
    return _airportsArray;
}

- (Cities *)cityForIATA:(NSString *)iata {
    if (iata) {
        for (Cities *city in _citiesArray) {
            if ([city.code isEqualToString:iata]) {
                return city;
            }
        }
    }
    return nil;
}

- (Cities *)cityForLocation:(CLLocation *)location {
    for (Cities *city in _citiesArray) {
        if (ceilf(city.coordinate.latitude) == ceilf(location.coordinate.latitude) && ceilf(city.coordinate.longitude) == ceilf(location.coordinate.longitude)) {
            return city;
        }
    }
    return nil;
}

@end
