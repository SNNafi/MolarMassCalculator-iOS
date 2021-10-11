//
//  MolarMassCalculatorSwift.m
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 10/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MolarMassCalculatorSwift.h"
#import "molar_mass_calculator.hpp"

@implementation ElementInfoSwift: NSObject

-(id) initWithElementInfo:(NSString *)symbol number:(int)number {
    if (self = [super init]) {
        self.symbol = symbol;
        self.number = number;
    }
    return self;
    
}
@end




@interface MolarMassCalculatorSwift()
@property MolarMassCalculator *calculator;
@end
@implementation MolarMassCalculatorSwift
- (instancetype)init {
    if (self = [super init]) {
        self.calculator = new MolarMassCalculator();
    }
    return self;
}

- (NSString*)getMass:(NSString *)formula {
    return [NSString stringWithUTF8String:self.calculator->getMolarMass(std::string([formula cStringUsingEncoding:NSUTF8StringEncoding])).c_str()];
}

- (double)getElement:(int)index {
    return self.calculator->getElementMass(index);
}

- (NSMutableArray*)getResult {
//    return [NSMutableArray arrayWithObjects:self.calculator->getResult() count:self.calculator->getResult().size()];
    id infos = [NSMutableArray new];
    for(auto i: self.calculator->getResult()){
  
        ElementInfoSwift *data = [[ElementInfoSwift alloc] initWithElementInfo:[NSString stringWithUTF8String:i.name.c_str()] number:i.number];
        [infos addObject:data];
        
        
//        ElementData elementData;
//        elementData.name = [NSString stringWithUTF8String:i.name.c_str()];
//        elementData.number = 0;
//        NSValue *anObj = [NSValue value:&elementData withObjCType:@encode(ElementData)];
//        [infos addObject:anObj];
    }
    return infos;
}

- (void) performCalculation:(NSString*)formula {
    self.calculator->performCalculation(std::string([formula cStringUsingEncoding:NSUTF8StringEncoding]));
}

- (bool) isWrongFormula {
    return self.calculator->isWrongFormula();
}

-(double) getMolarMass {
    return self.calculator->getMolarMass();
}

- (double) getElementMolarMassBySymbol:(NSString *)symbol {
    return self.calculator->getElementMolarMassBySymbol(std::string([symbol cStringUsingEncoding:NSUTF8StringEncoding]));
}

@end
