//
//  ContentView.swift
//  CasinoSlots
//
//  Created by Jerry Lai on 2020-12-26.
//  Copyright © 2020 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "cherry", "coin"]
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    
    var body: some View {
        
        ZStack{
            Rectangle()
            .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
            
            Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue:76/255))
            .rotationEffect(Angle(degrees: 45))
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                //title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor( .yellow)
                    
                    Text("Casino Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(1.8)
                Spacer()
                //counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.5))
                    .padding(.all, 10)
                Spacer()
                HStack{
                    Spacer()
                    Image(symbols[numbers[0]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Image(symbols[numbers[1]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Image(symbols[numbers[2]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Spacer()
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.numbers[0] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count-1)
                    
                    if self.numbers[0] == self.numbers[2] && self.numbers[1] == self.numbers[2]{
                        self.credits += 50 * 10
                    }else{
                        self.credits -= 50
                    }
                    
                }) {
                    Text("Spin")
                    .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        
                        .padding([.leading, .trailing], 30).background(Color.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
