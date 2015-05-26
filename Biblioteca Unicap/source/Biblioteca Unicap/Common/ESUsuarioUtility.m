//
//  ESUsuarioUtility.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/15/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESUsuarioUtility.h"

@implementation ESUsuarioUtility

+(instancetype) sharedInstance {
    static ESUsuarioUtility * instance;
    @synchronized(self) {
        if ( ! instance )
            instance = [[ESUsuarioUtility alloc] init];
    }
    return instance;
}

-(void)setUsuario:(ESUsuario *)usuario {
    _usuario = usuario;
    self.logged = YES;
    [self saveUsuario];
}

-(ESUsuario *)getUser {
    if ( ! _usuario ) {
        NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
        //TODO get usuario from nsuserdefaults
        NSString *matricula = [defauls objectForKey:@"matricula"];
        if (matricula) {
            _usuario = [[ESUsuario alloc] init];
            _usuario.numMatricula       = matricula;
            _usuario.senha              = [defauls objectForKey:@"senha"];
            _usuario.codCookie          = [defauls objectForKey:@"cookie"];
            _usuario.nomUsuario         = [defauls objectForKey:@"nome"];
            NSMutableArray *arrayOfItemAsData = [defauls objectForKey:@"itensPendentes"];
            NSMutableArray *itens = [[NSMutableArray alloc] init];
            for (NSData *itemAsData in arrayOfItemAsData) {
                ESItensPendentes *itemPendente = [NSKeyedUnarchiver unarchiveObjectWithData:itemAsData];
                [itens addObject:itemPendente];
            }
            _usuario.itensPendentes = itens;
            _logged = YES;
        } else {
            _logged = NO;
        }
        
        
    }
    return _usuario;
}

-(void)saveUsuario {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.usuario.numMatricula forKey:@"matricula"];
    [defaults setObject:self.usuario.senha forKey:@"senha"];
    [defaults setObject:self.usuario.codCookie forKey:@"cookie"];
    [defaults setObject:self.usuario.nomUsuario forKey:@"nome"];
    NSMutableArray *arrayOfItemAsData = [NSMutableArray arrayWithCapacity:self.usuario.itensPendentes.count];
    for (ESItensPendentes *item in self.usuario.itensPendentes) {
        NSData *itemAsData = [NSKeyedArchiver archivedDataWithRootObject:item];
        [arrayOfItemAsData addObject:itemAsData];
    }
    [defaults setObject:arrayOfItemAsData forKey:@"itensPendentes"];
    [defaults synchronize];
}

-(BOOL)logged {
    if ([self getUser])
        return YES;
    return NO;
}

-(void)doLogout {
    self.usuario = nil;
    [self saveUsuario];
}

- (BOOL)hasBookAsItemPendente:(NSString *)numAcervo {
    for (ESItensPendentes *itemPendente in self.usuario.itensPendentes) {
        if ([itemPendente.numAcervo isEqualToString:numAcervo]) {
            return YES;
        }
    }
    return NO;
}

@end
