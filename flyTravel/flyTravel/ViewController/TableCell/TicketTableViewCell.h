//
//  TicketTableViewCell.h
//  flyTravel
//
//  Created by user179996 on 28.06.2021.
//

#import "DataManager.h"
#import "APIManager.h"
#import "Tickets.h"


NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell
@property (nonatomic, strong) Tickets *ticket;
@end

NS_ASSUME_NONNULL_END

