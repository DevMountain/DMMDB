//
//  MovieListTableViewDataSource.m
//  MovieSearch2
//
//  Created by Taylor Mott on 25 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "MovieListTableViewDataSource.h"
#import "MovieController.h"

static NSString *kMovieCellID = @"movieCellID";

@implementation MovieListTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MovieController sharedInstance].resultMovies count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMovieCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kMovieCellID];
    }
    
    NSDictionary *movie = [MovieController sharedInstance].resultMovies[indexPath.row];
    NSString *movieTitle = movie[@"title"];
    NSString *releaseYear = [[movie[@"release_date"] componentsSeparatedByString:@"-"] objectAtIndex:0]; //returns just the year
    NSString *rating = movie[@"vote_average"];
    
    cell.textLabel.text = movieTitle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", releaseYear, rating];
    
//    [cell.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92%@", movie[@"poster_path"]]]];
    
    return cell;
}

@end
