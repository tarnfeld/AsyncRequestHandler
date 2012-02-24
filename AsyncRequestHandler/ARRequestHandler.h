//
//  ARRequestHandler.h
//  AsyncRequestHandler
//
//  Created by Tom Arnfeld on 24/02/2012.
//  Copyright (c) 2012 Tom Arnfeld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRequestHandler : NSObject

+ (void)performGetRequestWithUri:(NSString *)text params:(NSDictionary *)params completionHandler:(void (^)(NSDictionary *, NSError *))completionBlock;
+ (void)performPostRequestWithUri:(NSString *)text params:(NSDictionary *)params completionHandler:(void (^)(NSDictionary *, NSError *))completionBlock;

+ (void)performRequestWithRequestType:(NSString *)type uri:(NSString *)text params:(NSDictionary *)params completionHandler:(void (^)(NSDictionary *, NSError *))completionBlock;

@end
