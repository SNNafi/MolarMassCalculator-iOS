//
//  ManaulView.swift
//  MolarMassCalculator
//
//  Created by Shahriar Nasim Nafi on 12/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct ManualView: View {
    
    @Binding var isPresented: Bool
    var geo: CGSize = CGSize(width: 300, height: 200)
    
    var body: some View {
        
        ZStack(alignment: .center) {
                  VStack{
                      Text("Manaul")
                          .fontWeight(.bold)
                          .padding(5)
                      ScrollView {
                          if #available(iOS 15.0, *) {
                              Text("This calculator can handle about all types of formula. But you need to keep in mind this\n\nFor 4H2O, you should write (H2O)4\n\nAnother example\n\n4MgCO3.Mg(OH)2.4H2O, you should write (MgCO3)4.Mg(OH)2.(H2O)4")
                                  .textSelection(.enabled)
                                  .padding()
                          } else {
                              Text("This calculator can handle about all types of formula. But you need to keep in mind this\n\nFor 4H2O, you should write (H2O)4\n\nAnother example\n\n4MgCO3.Mg(OH)2.4H2O, you should write (MgCO3)4.Mg(OH)2.(H2O)4")
                                  .padding()
                                 
                          }
                      }
                      Divider()
                      HStack{
                          Spacer()
                          Button(action: {
                              print("Ok")
                              self.isPresented.toggle()
                          }) {
                              
                              Text("Ok")
                          }
                          .padding(5)
                          Spacer()
                          
                      }
                  }
              }
              .background(Color(white: 0.9))
              .frame(width: geo.width * 0.7, height: geo.height * 0.4)
              .cornerRadius(20)
              .shadow(radius: 20)
            

       
    }
}

struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        ManualView(isPresented: .constant(false))
    }
}
