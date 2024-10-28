//
//  CalculatorView.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 11/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var formula: String = ""
    @State var molarMassText: String = ""
    @State var molarMass: Double = 0
    @State var elementInfos = [ElementInfoSwift]()
    var calculator: MolarMassCalculatorSwift = MolarMassCalculatorSwift()
    @Environment(\.colorScheme) var colorScheme
    @State var isPresented = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter Formula", text: $formula) {
                // UIApplication.shared.endEditing()
            }
            .multilineTextAlignment(.center)
            .fixedSize()
            .padding(.top, 30)
            .padding(.bottom, 10)
            
            Text("Molecular Weight")
            Text(molarMassText)
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [ GridItem(.flexible()),  GridItem(.flexible())], spacing: 40) {
                    ForEach(elementInfos) {
                        elementInfo in
                        ElementInfoView(calculator: calculator, totalMass: molarMass, elementInfo: elementInfo)
                    }
                }
            }
            HStack {
                Text("Made with ")
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("by Shahriar Nasim Nafi")
            }
            
        }
        .alert(isPresented: $isPresented) {
            Alert(title: Text("Manaul"), message: Text("This calculator can handle about all types of formula. But you need to keep in mind this\n\nFor 4H2O, you should write (H2O)4\n\nAnother example\n\n4MgCO3.Mg(OH)2.4H2O, you should write (MgCO3)4.Mg(OH)2.(H2O)4"), dismissButton: .default(Text("Got it!")))
        }
        .toolbar {
            Button {
                // UIApplication.shared.endEditing()
                isPresented = true
            } label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(colorScheme == .light ? .black : .white)
            }
        }
        .onChange(of: formula) { _ in
            elementInfos = []
            guard !formula.isEmpty else {
                molarMassText = ""
                return
            }
            
            let sFormula = formula.replacingOccurrences(of: ".", with: "")
            calculator.performCalculation(sFormula)
            
            if (!calculator.isWrongFormula()) {
                molarMass = calculator.getMolarMass()
                molarMassText = String(format: "%0.2f g/mol", arguments: [molarMass])
                let result = calculator.getResult()
                print(result)
                for i in calculator.getResult() {
                    if let elementInfo = i as? ElementInfoSwift {
                        elementInfos.append(elementInfo)
                    }
                }
            } else {
                molarMassText = "Wrong Formula!"
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(calculator: MolarMassCalculatorSwift())
    }
}
