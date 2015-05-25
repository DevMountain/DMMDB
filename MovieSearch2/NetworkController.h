//
//  NetworkController.h
//  MovieSearch2
//
//  Created by Taylor Mott on 25 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

@import Foundation;

@interface NetworkController : NSObject

+ (NSString *)baseURLString;

+ (NSString *)parametersWithAPIKey:(NSDictionary *)parameters;

+ (NSString *)apiKey;

@end
