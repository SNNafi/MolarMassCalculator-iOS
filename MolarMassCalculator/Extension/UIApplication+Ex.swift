//
//  UIApplication+Ex.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 12/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func resignFirstResponder() {
            sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension ElementInfoSwift {
    open override var description: String {
        return "\(symbol) \(number)"
    }
}
