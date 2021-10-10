//
//  ContentView.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 10/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CalculatorView()
                .navigationTitle("Molar Mass Calculator")
                .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MolarMassCalculatorSwift())
    }
}

extension ElementInfoSwift: Identifiable {
    public var id: String {
        symbol
    }
}
