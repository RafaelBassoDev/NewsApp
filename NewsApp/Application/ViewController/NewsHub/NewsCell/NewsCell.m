//
//  NSObject+NewsCell.m
//  NewsApp
//
//  Created by Rafael Basso on 21/05/24.
//

#import "NewsCell.h"

@interface NewsCell ()
@property (nonatomic, readonly) NewsModel news;
@end

@implementation NewsCell {
    UILabel *labelTitle;
    UILabel *labelAuthor;
    UILabel *labelDescription;
    UIImageView *imageBanner;
}

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
    imageBanner = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    imageBanner.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:imageBanner];
    
    labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    labelTitle.translatesAutoresizingMaskIntoConstraints = false;
    labelTitle.text = @"";
    labelTitle.backgroundColor = UIColor.greenColor;
    [self addSubview:labelTitle];
    
    labelAuthor = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    labelAuthor.translatesAutoresizingMaskIntoConstraints = false;
    labelAuthor.text = @"";
    labelAuthor.backgroundColor = UIColor.yellowColor;
    [self addSubview:labelAuthor];
    
    labelDescription = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    labelDescription.translatesAutoresizingMaskIntoConstraints = false;
    labelDescription.text = @"";
    [self addSubview:labelDescription];
    
    [NSLayoutConstraint activateConstraints: @[
        [labelTitle.topAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.topAnchor constant: 0],
        [labelTitle.leadingAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.leadingAnchor constant: 0],
        [labelTitle.trailingAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.trailingAnchor constant: 0],
        
        [labelAuthor.topAnchor constraintEqualToAnchor: labelTitle.bottomAnchor constant: 10],
        [labelAuthor.bottomAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.bottomAnchor constant: 0],
        [labelAuthor.leadingAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.leadingAnchor constant: 0],
        [labelAuthor.trailingAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.trailingAnchor constant: 0],
    ]];
    
    
}

- (void) setupWithTitle:(NSString *)newTitle author:(NSString *)newAuthor description:(NSString *)newDescription banner:(UIImage *)newBanner {
    NewsModel newModel;
    newModel.title = newTitle;
    newModel.author = newAuthor;
    newModel.description = newDescription;
    newModel.banner = newBanner;
    _news = newModel;
}

- (void) setupWithNews:(NewsModel) news {
    [labelTitle setText:news.title];
    [labelAuthor setText:news.author];
    [labelDescription setText:news.description];
    [imageBanner setImage:news.banner];
}

@end
