//
//  ESBaseService.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "ESError.h"

@interface ESBaseService : NSObject

+(instancetype) sharedInstance;

+(NSString *)baseURLString;
@property (strong, nonatomic) NSString *commomIP;

+ (void) doGetRequestWithParams:(NSDictionary *)params
                        success:(void (^)(id))success
                        failure:(void (^)(ESError *))failure;

+ (void) doPostRequestWithParams:(NSDictionary *)params
                         success:(void (^)(id))success
                         failure:(void (^)(ESError *))failure;

@property (nonatomic) BOOL hasConnection;

@end
