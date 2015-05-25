//
//  ViewController.m
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "MovieListViewController.h"
#import "UIView+FLKAutoLayout.h"

static CGFloat kMarginMovieList = 10.0;

@interface MovieListViewController ()

@property (strong, nonatomic) UITextField *searchField;
@property (strong, nonatomic) UIButton *searchButton;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.searchField = [UITextField new];
    self.searchField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchField.placeholder = @"Search Movie Name";
    [self.view addSubview:self.searchField];
    
    self.searchButton = [UIButton new];
    [self.searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    //Add Target/Action
    [self.view addSubview:self.searchButton];
    
    self.tableView = [UITableView new];
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

@end
