//
//  ViewController.m
//  NewsApp
//
//  Created by Rafael Basso on 21/05/24.
//

#import "NewsHubViewController.h"

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
    
//    [self.tableView registerClass: forCellReuseIdentifier:];
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cellIdentifier";
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_content objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Did click on cell: %@", [_content objectAtIndex:indexPath.row]);
}

@end
