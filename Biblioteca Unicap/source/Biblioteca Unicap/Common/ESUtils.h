//
//  ESUtils.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/6/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESLivro.h"

@interface ESUtils : NSObject

+(NSArray *)parseResponseWithKey:(NSString *)key andResponseObject:(id)responseObject;

@end
