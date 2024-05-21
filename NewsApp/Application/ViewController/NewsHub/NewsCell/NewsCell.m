//
//  NSObject+NewsCell.m
//  NewsApp
//
//  Created by Rafael Basso on 21/05/24.
//

#import "NewsCell.h"

@interface NewsCell ()
//- (void) setupWithConfig:
@end

@implementation NewsCell

static NSString* cellIdentifier = @"newsCellIdentifier";
+ (NSString*) identifier {
    @synchronized (self) { return cellIdentifier; }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = UIColor.purpleColor;
        [self setupUI];
    }
    
    return self;
}

- (void) setupUI {
    self.contentView.translatesAutoresizingMaskIntoConstraints = false;
    
//    [NSLayoutConstraint activateConstraints: @[]];
}

@end
