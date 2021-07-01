//
//  MapPrice.h
//  flyTravel
//
//  Created by user179996 on 01.07.2021.
//

#import <Foundation/Foundation.h>
#import "Cities.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapPrice : NSObject

@property (strong, nonatomic) Cities *destination;
@property (strong, nonatomic) Cities *origin;
@property (strong, nonatomic) NSDate *departure;
@property (strong, nonatomic) NSDate *returnDate;
@property (nonatomic) NSInteger numberOfChanges;
@property (nonatomic) NSInteger value;
@property (nonatomic) NSInteger distance;
@property (nonatomic) BOOL actual;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary withOrigin: (Cities *)origin;

@end

NS_ASSUME_NONNULL_END
