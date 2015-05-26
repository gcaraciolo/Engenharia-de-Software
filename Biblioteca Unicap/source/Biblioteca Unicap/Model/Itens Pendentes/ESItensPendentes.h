//
//  ESItensPendentes.h
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import <Foundation/Foundation.h>
#import <Mantle.h>


@interface ESItensPendentes : MTLModel <MTLJSONSerializing>

@property (nonatomic, retain) NSString * nomItem;
@property (nonatomic, retain) NSString * numAcervo;
@property (nonatomic, retain) NSString * numRenovacao;
@property (nonatomic, retain) NSString * dthRenovacao;
@property (nonatomic, retain) NSString * numExemplar;
@property (nonatomic, retain) NSString * vlrTaxaParcial;

@end
