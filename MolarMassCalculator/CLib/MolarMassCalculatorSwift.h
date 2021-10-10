//
//  MolarMassCalculatorSwift.h
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 10/10/21.
//

#ifndef MolarMassCalculatorSwift_h
#define MolarMassCalculatorSwift_h


#endif /* MolarMassCalculatorSwift_h */

#import <Foundation/Foundation.h>

@interface MolarMassCalculatorSwift : NSObject
- (double)getElement:(int)index;
- (NSString*)getMass:(NSString*)formula;
- (NSMutableArray*)getResult;
- (void) performCalculation: (NSString*)formula;
- (bool) isWrongFormula;
- (double) getMolarMass;
- (double) getElementMolarMassBySymbol: (NSString*)symbol;
@end

@interface ElementInfoSwift : NSObject
- (id)initWithElementInfo:(NSString *)symbol number:(int)number;
@property NSString *symbol;
@property int number;
@end
