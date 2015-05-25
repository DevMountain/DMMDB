//
//  MovieDetailViewController.m
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIView+FLKAutoLayout.h"

static CGFloat kMarginMovieDetail = 10.0;
static CGFloat kVerticalSpacingMovieDetail = 5.0;
static CGFloat kSmallVerticalSpacingMovieDetail = 2.0;

@interface MovieDetailViewController ()

@property (strong, nonatomic) UIImageView *posterImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *releaseDateHeaderLabel;
@property (strong, nonatomic) UILabel *releaseDateLabel;
@property (strong, nonatomic) UILabel *ratingHeaderLabel;
@property (strong, nonatomic) UILabel *ratingLabel;
@property (strong, nonatomic) UILabel *voteCountHeaderLabel;
@property (strong, nonatomic) UILabel *voteCountLabel;
@property (strong, nonatomic) UILabel *taglineLabel;
@property (strong, nonatomic) UILabel *summaryLabel;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.movie.title;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.posterImageView = [UIImageView new];
    [self loadImage];
    [self.view addSubview:self.posterImageView];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = self.movie.title;
    self.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [self.view addSubview:self.titleLabel];
    
    self.releaseDateHeaderLabel = [UILabel new];
    self.releaseDateHeaderLabel.text = @"Release Date:";
    self.releaseDateHeaderLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.releaseDateHeaderLabel];
    
    self.releaseDateLabel = [UILabel new];
    self.releaseDateLabel.text = self.movie.releaseDate;
    self.releaseDateLabel.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:self.releaseDateLabel];
    
    self.ratingHeaderLabel = [UILabel new];
    self.ratingHeaderLabel.text = @"Rating:";
    self.ratingHeaderLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.ratingHeaderLabel];
    
    self.ratingLabel = [UILabel new];
    self.ratingLabel.text = [self.movie.rating stringValue];
    self.ratingLabel.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:self.ratingLabel];
    
    self.voteCountHeaderLabel = [UILabel new];
    self.voteCountHeaderLabel.text = @"Vote Count:";
    self.voteCountHeaderLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.voteCountHeaderLabel];
    
    self.voteCountLabel = [UILabel new];
    self.voteCountLabel.text = [self.movie.voteCount stringValue];
    self.voteCountLabel.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:self.voteCountLabel];
    
    self.taglineLabel = [UILabel new];
    self.taglineLabel.text = self.movie.tagline;
    self.taglineLabel.font = [UIFont systemFontOfSize:15.0];
    self.taglineLabel.numberOfLines = 0;
    [self.view addSubview:self.taglineLabel];
    
    self.summaryLabel = [UILabel new];
    self.summaryLabel.text = self.movie.summary;
    self.summaryLabel.font = [UIFont systemFontOfSize:15.0];
    self.summaryLabel.numberOfLines = 0;
    [self.view addSubview:self.summaryLabel];
    
    //Set up constraints with whatever method you feel most comfortable with
    [self setupConstraints];
}

- (void)setupConstraints
{//Set up constraints with whatever method you feel most comfortable with, in this case FLKAutoLayout
    NSString *margin = [NSString stringWithFormat:@"%.0f", kMarginMovieDetail];
    NSString *marginNegative = [NSString stringWithFormat:@"-%.0f", kMarginMovieDetail];
    NSString *verticalSpacing = [NSString stringWithFormat:@"%.0f", kVerticalSpacingMovieDetail];
    NSString *smallVerticalSpacing = [NSString stringWithFormat:@"%.0f", kSmallVerticalSpacingMovieDetail];
    
    //~4:3 aspect ratio
    [self.posterImageView constrainWidth:@"125" height:@"166.67"];
    [self.posterImageView alignTop:@"74" leading:margin toView:self.view];
    
    [self.titleLabel alignTopEdgeWithView:self.posterImageView predicate:nil];
    [self.titleLabel constrainLeadingSpaceToView:self.posterImageView predicate:margin];
    [self.titleLabel alignTrailingEdgeWithView:self.view predicate:marginNegative];
    
    [self.releaseDateHeaderLabel constrainTopSpaceToView:self.titleLabel predicate:verticalSpacing];
    [self.releaseDateHeaderLabel constrainLeadingSpaceToView:self.posterImageView predicate:margin];
    [self.releaseDateHeaderLabel alignTrailingEdgeWithView:self.view predicate:marginNegative];
    
    [self.releaseDateLabel constrainTopSpaceToView:self.releaseDateHeaderLabel predicate:smallVerticalSpacing];
    [self.releaseDateLabel constrainLeadingSpaceToView:self.posterImageView predicate:margin];
    [self.releaseDateLabel alignTrailingEdgeWithView:self.view predicate:marginNegative];
    
    [self.ratingHeaderLabel constrainTopSpaceToView:self.releaseDateLabel predicate:verticalSpacing];
    [self.ratingHeaderLabel constrainLeadingSpaceToView:self.posterImageView predicate:margin];
    [self.ratingHeaderLabel constrainWidth:@"100"];
    
    [self.ratingLabel constrainTopSpaceToView:self.ratingHeaderLabel predicate:smallVerticalSpacing];
    [self.ratingLabel constrainLeadingSpaceToView:self.posterImageView predicate:margin];
    [self.ratingLabel constrainWidthToView:self.ratingHeaderLabel predicate:@"0"];
    
    [self.voteCountHeaderLabel alignTopEdgeWithView:self.ratingHeaderLabel predicate:nil];
    [self.voteCountHeaderLabel constrainLeadingSpaceToView:self.ratingHeaderLabel predicate:margin];
    [self.voteCountHeaderLabel constrainWidth:@"100"];
    
    [self.voteCountLabel constrainTopSpaceToView:self.voteCountHeaderLabel predicate:smallVerticalSpacing];
    [self.voteCountLabel constrainLeadingSpaceToView:self.ratingLabel predicate:margin];
    [self.voteCountLabel constrainWidthToView:self.voteCountHeaderLabel predicate:@"0"];
    
    [self.taglineLabel constrainTopSpaceToView:self.ratingLabel predicate:verticalSpacing];
    [self.taglineLabel constrainLeadingSpaceToView:self.posterImageView predicate:margin];
    [self.taglineLabel alignTrailingEdgeWithView:self.view predicate:marginNegative];
    [self.taglineLabel alignBottomEdgeWithView:self.posterImageView predicate:@"0"];
    
    [self.summaryLabel constrainTopSpaceToView:self.posterImageView predicate:verticalSpacing];
    [self.summaryLabel alignLeadingEdgeWithView:self.view predicate:margin];
    [self.summaryLabel alignTrailingEdgeWithView:self.view predicate:marginNegative];
    CGFloat summaryHeight = 166.67 + kVerticalSpacingMovieDetail + kMarginMovieDetail * 2;
    [self.summaryLabel constrainHeightToView:self.view predicate:[NSString stringWithFormat:@"<=*1-%.2f", summaryHeight]];
}

- (void)loadImage
{
    NSString *baseImageURL = @"http://image.tmdb.org/t/p/w92";
    NSString *stringURL = [baseImageURL stringByAppendingString:self.movie.imagePath];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error)
        {
            NSLog(@"ERROR loading image");
        }
        else
        {
            //Updating the UI must occur on main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                self.posterImageView.image = [UIImage imageWithData:data];
            });
        }
    }];
    
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
