//
//  ViewController.m
//  NewsApp
//
//  Created by Rafael Basso on 21/05/24.
//

#import "NewsHubViewController.h"
#import "NewsCell/NewsCell.h"

@interface NewsHubViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView* tableView;
@property (nonatomic) NSMutableArray* news;
@end

@implementation NewsHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.news = [[NSMutableArray alloc] init];
    
    [self populateNewsArray];
    
    self.title = @"";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass: NewsCell.class forCellReuseIdentifier: NewsCell.identifier];
    
    [self.view addSubview:self.tableView];
    
}

- (void)populateNewsArray {
    NewsModel model1;
    model1.title = @"Title";
    model1.author = @"Author";
    model1.description = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id aliquet risus. Ut mollis nibh velit, in consectetur tellus molestie ac. Cras tincidunt enim ligula, elementum tempus purus mollis nec. Nunc eleifend ultrices dignissim. Vivamus sed augue mattis, lacinia ante blandit, euismod ante.";
    model1.banner = nil;
    NSValue *boxedModel1 = [NSValue valueWithBytes:&model1 objCType:@encode(NewsModel)];
    NSValue *boxedModel2 = [NSValue valueWithBytes:&model1 objCType:@encode(NewsModel)];
    NSValue *boxedModel3 = [NSValue valueWithBytes:&model1 objCType:@encode(NewsModel)];
    
    [self.news addObject:boxedModel1];
    [self.news addObject:boxedModel2];
    [self.news addObject:boxedModel3];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NewsCell.identifier forIndexPath:indexPath];
    
    NewsModel tmpModel;
    NSValue *retVal = [self.news objectAtIndex:indexPath.row];
    [retVal getValue:&tmpModel];
    
    if (cell == nil) {
        UITableViewCell* defaultCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaultCell"];
        defaultCell.textLabel.text = tmpModel.title;
        defaultCell.detailTextLabel.text = tmpModel.description;
        return defaultCell;
    }
    
    [cell setupWithNews:tmpModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Did click on cell: %@", [self.news objectAtIndex:indexPath.row]);
}

@end
