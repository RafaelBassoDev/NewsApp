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
@property (strong, nonatomic) NSArray* content;
@end

@implementation NewsHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.content = @[@"Monday", @"Tuesday", @"Wednesday"];
    
    self.title = @"";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:NewsCell.class forCellReuseIdentifier:NewsCell.identifier];
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:NewsCell.identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        UITableViewCell* defaultCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaultCell"];
        defaultCell.textLabel.text = [_content objectAtIndex:indexPath.row];
        return defaultCell;
    }
    
    cell.textLabel.text = [_content objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Did click on cell: %@", [_content objectAtIndex:indexPath.row]);
}

@end
