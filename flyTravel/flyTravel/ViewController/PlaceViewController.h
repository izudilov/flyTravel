//
//  PlaceViewController.h
//  flyTravel
//
//  Created by user179996 on 24.06.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

typedef enum PlaceType {
    PlaceTypeArrival,
    PlaceTypeDeparture
} PlaceType;


@protocol PlaceViewControllerDelegate <NSObject>

-(void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;

@end


@interface PlaceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<PlaceViewControllerDelegate>delegate;
-(instancetype)initWithType:(PlaceType)type;

@end
