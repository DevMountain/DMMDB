//
//  NetworkController.m
//  MovieSearch2
//
//  Created by Taylor Mott on 25 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NetworkController.h"

#error MUST enter API key here
static NSString *kAPIKey = @"";

@implementation NetworkController

+ (NSString *)baseURLString
{
    return @"https://api.themoviedb.org/3/";
}

+ (NSString *)parametersWithAPIKey:(NSDictionary *)parameters
{
    NSString *parameterString = @"";
    parameterString = [parameterString stringByAppendingString:[self apiKey]];
    
    for (NSString *key in [parameters allKeys])
    {
        parameterString = [parameterString stringByAppendingString:@"&"];
        parameterString = [parameterString stringByAppendingString:[key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        parameterString = [parameterString stringByAppendingString:@"="];
        parameterString = [parameterString stringByAppendingString:[parameters[key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    return parameterString;
}

+ (NSString *)apiKey
{
    return [@"?api_key=" stringByAppendingString:kAPIKey];
}

@end
