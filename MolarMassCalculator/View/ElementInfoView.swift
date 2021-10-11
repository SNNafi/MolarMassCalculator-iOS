//
//  ElementInfoView.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 10/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct ElementInfoView: View {
    @EnvironmentObject var calculator: MolarMassCalculatorSwift
    var totalMass: Double = 8.01
    var elementInfo = ElementInfoSwift(elementInfo: "He", number: 2)
    
    private var number: Int {
        Int(elementInfo!.number)
    }
    
    private var elementMass: Double {
        calculator.getElementMolarMass(bySymbol: elementInfo!.symbol)
    }
    
    private var totalElementMass: Double {
        elementMass * Double(elementInfo!.number)
    }
    
    private var percentage: Double {
        totalElementMass / totalMass * 100
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(elementInfo!.symbol)
                    .font(.title)
                .fontWeight(.heavy)
            }
           
                Text("Total: ")
                .fontWeight(.bold)
                + Text("\(number)")
                
                Text("Molar Mass")
                .fontWeight(.bold)
                .padding(.top, 2)
                Text("\(String(format: "%0.4f", arguments: [elementMass])) g/mol")
                .padding(.bottom, 2)
                Text("Subtotal Mass")
                .fontWeight(.bold)
                Text("\(String(format: "%0.2f", arguments: [totalElementMass])) g/mol")
                .padding(.bottom, 2)
               
                Text("Percentage")
                .fontWeight(.bold)
                Text("\(String(format: "%0.2f", arguments: [percentage]))%")
           
            
         
        
            
        }
        .font(.subheadline)
        .frame(width: 150, height: 200, alignment: .center)
        .padding(.top, 5)
        .padding(.leading, 5)
        
        
        
    }
}

struct ElementInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ElementInfoView()
            .environmentObject(MolarMassCalculatorSwift())
    }
}
