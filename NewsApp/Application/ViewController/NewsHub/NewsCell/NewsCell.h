//
//  NSObject+NewsCell.h
//  NewsApp
//
//  Created by Rafael Basso on 21/05/24.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsCell : UITableViewCell
+ (NSString*) identifier;
- (void) setupWithNews:(NewsModel) news;
@end
