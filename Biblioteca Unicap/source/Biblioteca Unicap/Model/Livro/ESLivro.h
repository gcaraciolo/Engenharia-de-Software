//
//  ESLivro.h
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Mantle.h"



@interface ESLivro : MTLModel <MTLJSONSerializing>

@property (nonatomic, retain) NSString * dscItem;
@property (nonatomic, retain) NSString * numAcervo;
@property (nonatomic, retain) NSString * srcImagem;
@property (nonatomic, retain) NSString * nomItem;
@property (nonatomic, retain) NSString * numItem;
@property (nonatomic, retain) NSString * numChamada;
@property (nonatomic, retain) NSString * nomAutor;

@end
