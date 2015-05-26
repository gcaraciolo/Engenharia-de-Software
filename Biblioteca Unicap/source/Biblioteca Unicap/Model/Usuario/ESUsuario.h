//
//  ESUsuario.h
//  
//
//  Created by Guilherme Caraciolo on 5/13/15.
//
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
#import "ESItensPendentes.h"

@interface ESUsuario : MTLModel <MTLJSONSerializing>

@property (nonatomic, retain) NSString * codCookie;
@property (nonatomic, retain) NSString * numMatricula;
@property (nonatomic, retain) NSString * senha;
@property (nonatomic, retain) NSString * nomUsuario;
@property (nonatomic, retain) NSArray *itensPendentes;



@end
