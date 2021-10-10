//
//  CalculatorView.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 11/10/21.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var formula: String = ""
    @State var mass: String = ""
    @State var elementInfos = [ElementInfoSwift]()
    @EnvironmentObject var calculator: MolarMassCalculatorSwift
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter Formula", text: $formula)
                .fixedSize()
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            
            Text("Molecular Weight")
            Text(mass)
                .font(.largeTitle)
            
       
            ScrollView {
                LazyVGrid(columns: [ GridItem(.flexible()),  GridItem(.flexible())], spacing: 40) {
                        ForEach(elementInfos) {
                            elementInfo in
                            if let mass = Double(mass) {
                                ElementInfoView(totalMass: mass, elementInfo: elementInfo)
                            }
                           
                        }
                }
            }
            
            
        }
        .onChange(of: formula) { _ in
            elementInfos = []
            guard !formula.isEmpty else {
                mass = ""
                return
            }
            calculator.performCalculation(formula)
            if (!calculator.isWrongFormula()) {
                mass = String(format: "%0.2f", arguments: [calculator.getMolarMass()])
                
                
                //                print(calculator.getMolarMass()
                for i in calculator.getResult() {
                    if let elementInfo = i as? ElementInfoSwift {
                        elementInfos.append(elementInfo)
                        print("\(elementInfo.symbol!) ->", elementInfo.number)
                        
                    }
                }
                print("-------------")
            } else {
                mass = "Wrong Formula!"
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(MolarMassCalculatorSwift())
    }
}
