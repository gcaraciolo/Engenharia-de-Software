//
//  ESBaseService.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESBaseService.h"
#import "ESError.h"
#import "ESResponse.h"
#import "NSString+Extensions.h"

@implementation ESBaseService


+(instancetype ) sharedInstance {
    static id sharedInstance;
    @synchronized(self) {
        if ( ! sharedInstance )
            sharedInstance = [[ESBaseService alloc] init];
            [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
    return sharedInstance;
}


+(NSString *)baseURLString {
    if ([[[ESBaseService sharedInstance] commomIP] isValid] && [[[ESBaseService sharedInstance] commomIP] length] == 12) {
        return [[ESBaseService sharedInstance] commomIP];
    }
    return [self ExternalNodeServer];
}


+(NSString *)thiagoServer {
    NSString * url = @"172.17.18.102";
    NSString * port = @"8080";
    return [NSString stringWithFormat:@"http://%@:%@/BibliotecaWeb/Service",url,port];

}

+(NSString *)InternalNodeServer {
    return @"http://localhost:3000/BibliotecaWeb/Service";
}

+(NSString *)ExternalNodeServer {
    return @"http://172.17.16.227:3000/BibliotecaWeb/Service";
}

+(NSString *)raywenderlich {
    return @"http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json";
}




+ (void) doGetRequestWithParams:(NSDictionary *)params
                     success:(void (^)(id))success
                        failure:(void (^)(ESError *))failure {
    
    NSMutableString * urlAsString = [NSMutableString stringWithFormat:@"%@", [ESBaseService baseURLString]];
    [urlAsString appendString:@"?"];
    [urlAsString appendFormat:@"t=%@", params[@"t"]];
    [urlAsString appendString:@"&"];
    [urlAsString appendFormat:@"q=%@", params[@"q"]];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlAsString
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            ESError *esError = [[ESError alloc] init];
            failure(esError);
    }];
    
}

+ (void) doPostRequestWithParams:(NSDictionary *)params
                         success:(void (^)(id))success
                         failure:(void (^)(ESError *))failure {
    
    NSMutableString * urlAsString = [NSMutableString stringWithFormat:@"%@", [ESBaseService baseURLString]];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:params[@"t"] forHTTPHeaderField:@"t"];
    [manager.requestSerializer setValue:params[@"q"] forHTTPHeaderField:@"q"];
    [manager.requestSerializer setValue:params[@"m"] forHTTPHeaderField:@"m"];
    [manager.requestSerializer setValue:params[@"s"] forHTTPHeaderField:@"s"];
    [manager.requestSerializer setValue:params[@"c"] forHTTPHeaderField:@"c"];
    
    [manager POST:urlAsString
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              id response = responseObject;
              ESError *error = [[ESError alloc] init];
              BOOL check = [ESBaseService checkResponseStatusCode:response error:error];
              if (check) {
                  NSLog(@"%@", response);
                  success(response);
              } else {
                  failure(error);
              }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        ESError *esError = [[ESError alloc] init];
        esError.error = error;
        failure(esError);
        
    }];
}

+(BOOL)checkResponseStatusCode:(id)responseObject error:(ESError *)error{
    ESResponse *response = [MTLJSONAdapter modelOfClass:[ESResponse class]
                                     fromJSONDictionary:responseObject
                                                  error:nil];
    if ([response.statusCode isEqualToString:@"-1"]) {
        error.networkingError = -1;
        return NO;
    } else if ([response.statusCode isEqualToString:@"0"]) {
        error.networkingError = 0;
        return NO;
    }
    else if ([response.statusCode isEqualToString:@"1"]) {
        return  YES;
    }
    return YES;
}

-(BOOL)hasConnection {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       _hasConnection = status == AFNetworkReachabilityStatusReachableViaWiFi || AFNetworkReachabilityStatusReachableViaWWAN;
    }];
    return _hasConnection;
}


@end
