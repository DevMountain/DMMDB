//
//  ViewController.m
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "MovieListViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "MovieListTableViewDataSource.h"
#import "MovieController.h"

static CGFloat kMarginMovieList = 10.0;

@interface MovieListViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *searchField;
@property (strong, nonatomic) UIButton *searchButton;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) MovieListTableViewDataSource *dataSource;

@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.searchField = [UITextField new];
    self.searchField.delegate = self;
    self.searchField.returnKeyType = UIReturnKeySearch;
    self.searchField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchField.placeholder = @"Search Movie Name";
    [self.view addSubview:self.searchField];
    
    self.searchButton = [UIButton new];
    [self.searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(searchButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchButton];
    
    self.dataSource = [MovieListTableViewDataSource new];
    
    self.tableView = [UITableView new];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    //Set up constraints with whatever method you feel most comfortable with
    [self setupConstraints];
}

- (void)setupConstraints
{//Set up constraints with whatever method you feel most comfortable with, in this case FLKAutoLayout
    
    NSString *margin = [NSString stringWithFormat:@"%.0f", kMarginMovieList];
    NSString *marginNegative = [NSString stringWithFormat:@"-%.0f", kMarginMovieList];
    
    //Search Field
    [self.searchField constrainWidthToView:self.view predicate:[NSString stringWithFormat:@"*.70-%.0f", kMarginMovieList * 2]];
    [self.searchField alignTop:@"74" leading:margin toView:self.view];
    
    //Search Button
    [self.searchButton alignTopEdgeWithView:self.searchField predicate:nil];
    [self.searchButton alignTrailingEdgeWithView:self.view predicate:marginNegative];
    [self.searchButton constrainWidthToView:self.view predicate:[NSString stringWithFormat:@"*.30-%.0f", kMarginMovieList * 2]];
    [self.searchButton constrainHeightToView:self.searchField predicate:nil];
    
    //TableView
    [self.tableView constrainTopSpaceToView:self.searchField predicate:margin];
    [self.tableView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.tableView alignBottomEdgeWithView:self.view predicate:@"0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Search Button Method

- (void)searchButtonPressed
{
    [self hideKeyboard];
    [[MovieController sharedInstance] getMoviesWithName:self.searchField.text completion:^(BOOL success) {
        if (success) {
            //Updating the UI must occur on main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self searchButtonPressed];
    return YES;
}

- (void)hideKeyboard
{
    [self.searchField resignFirstResponder];
}

@end
