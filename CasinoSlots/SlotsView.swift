//
//  SlotsView.swift
//  CasinoSlots
//
//  Created by Jerry Lai on 2020-12-27.
//  Copyright © 2020 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SlotsView: View {
    @State private var symbols = ["apple", "cherry", "coin"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    
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
                
                VStack{
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[0]], bgColor: $backgrounds[0])
                        CardView(symbol: $symbols[numbers[1]],bgColor: $backgrounds[1])
                        CardView(symbol: $symbols[numbers[2]],
                                 bgColor: $backgrounds[2])
                        Spacer()
                        
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[3]], bgColor: $backgrounds[3])
                        CardView(symbol: $symbols[numbers[4]],bgColor: $backgrounds[4])
                        CardView(symbol: $symbols[numbers[5]],
                                 bgColor: $backgrounds[5])
                        Spacer()
                        
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[6]], bgColor: $backgrounds[6])
                        CardView(symbol: $symbols[numbers[7]],bgColor: $backgrounds[7])
                        CardView(symbol: $symbols[numbers[8]],
                                 bgColor: $backgrounds[8])
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
                HStack(spacing: 20){
                    
                    VStack{
                        Button(action: {
                            
                            self.processResult(false)
                            
                        }) {
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                
                                .padding([.leading, .trailing], 30).background(Color.pink)
                                .cornerRadius(20)
                        }
                        
                        Text("5 credits")
                        .bold()
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                    
                    VStack{
                        
                        Button(action: {
                            
                            self.processResult(true)
                            
                        }) {
                            Text("Max Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                
                                .padding([.leading, .trailing], 30).background(Color.pink)
                                .cornerRadius(20)
                        }

                        Text("25 credits")
                        .bold()
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                    
                    
                    
                    
                                }
                
                
                Spacer()
            }
        }
        
        
    }
    
    func processResult(_ isMax: Bool = false){
        
        //set bg to white
        self.backgrounds = self.backgrounds.map{
            _ in Color.white
        }
        
        if isMax {
            //spin all rows
            self.numbers = self.numbers.map{
                _ in Int.random(in: 0...self.symbols.count-1)
            }
        }else{
            //spin middel row
            self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
        }
        
        
        processWin(isMax)
        
    }
    
    func processWin(_ isMax: Bool = false){
        
        var matches = 0
        
        if !isMax{
            if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5]{
                matches += 1
                self.backgrounds[3] = Color.green
                self.backgrounds[4] = Color.green
                self.backgrounds[5] = Color.green
            }
        }else{
            if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]{
                matches += 1
                self.backgrounds[0] = Color.green
                self.backgrounds[1] = Color.green
                self.backgrounds[2] = Color.green
            }
            
            if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5]{
                matches += 1
                self.backgrounds[3] = Color.green
                self.backgrounds[4] = Color.green
                self.backgrounds[5] = Color.green
            }
            
            if self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8]{
                matches += 1
                self.backgrounds[6] = Color.green
                self.backgrounds[7] = Color.green
                self.backgrounds[8] = Color.green
            }
            
            if self.numbers[0] == self.numbers[4] && self.numbers[4] == self.numbers[8]{
                matches += 1
                self.backgrounds[0] = Color.green
                self.backgrounds[4] = Color.green
                self.backgrounds[8] = Color.green
            }
            
            if self.numbers[2] == self.numbers[4] && self.numbers[4] == self.numbers[6]{
                matches += 1
                self.backgrounds[2] = Color.green
                self.backgrounds[4] = Color.green
                self.backgrounds[6] = Color.green
            }
            
        }
        
        if matches > 0{
            self.credits += 6 * 10 * matches
        }else if isMax{
            self.credits -= 25
        }else{
            self.credits -= 5
        }
        
    }
}

struct SlotsView_Previews: PreviewProvider {
    static var previews: some View {
        SlotsView()
    }
}
