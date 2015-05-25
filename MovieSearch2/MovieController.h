//
//  MovieController.h
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

@import Foundation;
#import "Movie.h"

@interface MovieController : NSObject

+ (MovieController *)sharedInstance;

@property (nonatomic, strong) NSArray *resultMovies;

- (void)getMoviesWithName:(NSString *)name completion:(void (^)(BOOL success))completion;
- (void)getMovieWithID:(NSString *)movieID completion:(void (^)(Movie *movie))completion;

@end
