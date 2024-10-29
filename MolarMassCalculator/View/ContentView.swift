//
//  ContentView.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 10/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack(alignment: .center) {
                    CalculatorView()
                        .navigationTitle("Molar Mass Calculator")
                        .navigationBarTitleDisplayMode(.inline)
                        
                  
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}

extension ElementInfoSwift: Identifiable {
    public var id: String {
        symbol
    }
}
