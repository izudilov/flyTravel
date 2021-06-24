//
//  Countries.h
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Countries : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *translations;
@property (nonatomic, strong) NSString *code;

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
