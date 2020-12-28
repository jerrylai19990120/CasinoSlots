//
//  Welcome.swift
//  CasinoSlots
//
//  Created by Jerry Lai on 2020-12-27.
//  Copyright © 2020 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Welcome: View {
    
    @State private var selection: Int? = nil
    var body: some View {
        ZStack{
                   Rectangle()
                   .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                   .edgesIgnoringSafeArea(.all)
                   
                   Rectangle()
                   .foregroundColor(Color(red: 228/255, green: 195/255, blue:76/255))
                   .rotationEffect(Angle(degrees: 45))
                   .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination: Text("hello"), tag: 1, selection: $selection){
                Button(action: {
                    self.selection = 1
                }){
                    Text("Let's Play")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    
                    .padding([.leading, .trailing], 30).background(Color.pink)
                    .cornerRadius(20)
                }
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
