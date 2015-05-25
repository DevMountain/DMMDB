//
//  MovieController.m
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "MovieController.h"
#import "NetworkController.h"

@implementation MovieController

+ (MovieController *)sharedInstance {
    
    static MovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MovieController new];
    });
    return sharedInstance;
    
}

- (void)getMoviesWithName:(NSString *)name completion:(void (^)(BOOL))completion
{
    NSString *path = [NetworkController baseURLString];
    
    path = [path stringByAppendingString:@"search/movie"];
    
    path = [path stringByAppendingString:[NetworkController parametersWithAPIKey:@{@"query":name}]];
    
    //Here path should look something like this
    //https://api.themoviedb.org/3/search/movie?api_key=<YOUR_API_KEY>&query=fargo
    
    NSURL *url = [NSURL URLWithString:path];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error)
        {
            NSLog(@"%s - I'm an Error", __PRETTY_FUNCTION__);
            NSLog(@"ERROR: %@", error);
            completion(NO);
        }
        else
        {
            NSDictionary *serializedResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%s - response: %@", __PRETTY_FUNCTION__, serializedResponse);
            self.resultMovies = serializedResponse[@"results"];
            completion(YES);
        }
    }];
    
    [dataTask resume];
}

- (void)getMovieWithID:(NSString *)movieID completion:(void (^)(Movie *movie))completion
{
    NSString *path = [NetworkController baseURLString];
    
    path = [path stringByAppendingString:@"movie/"];
    
    path = [path stringByAppendingString:movieID];
    
    path = [path stringByAppendingString:[NetworkController apiKey]];
    
    //Here path should look something like this
    //https://api.themoviedb.org/3/movie/275?api_key=<YOUR_API_KEY>
    
    NSURL *url = [NSURL URLWithString:path];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error)
        {
            NSLog(@"%s - I'm an Error", __PRETTY_FUNCTION__);
            NSLog(@"ERROR: %@", error);
            completion(nil);
        }
        else
        {
            NSDictionary *serializedResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%s - response: %@", __PRETTY_FUNCTION__, serializedResponse);
            Movie *resultMovie = [[Movie alloc] initWithDictionary:serializedResponse];
            completion(resultMovie);
        }
    }];
    
    [dataTask resume];
}

@end
