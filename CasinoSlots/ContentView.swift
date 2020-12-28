//
//  ContentView.swift
//  CasinoSlots
//
//  Created by Jerry Lai on 2020-12-26.
//  Copyright © 2020 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int? = nil
    var body: some View {
        
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                    .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .foregroundColor(Color(red: 228/255, green: 195/255, blue:76/255))
                    .rotationEffect(Angle(degrees: 45))
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 60){
                    Spacer()
                    Text("Casino Las Vegas").foregroundColor(.white)
                        .font(.system(size: 46)).italic()
                    HStack(alignment: .center, spacing: 20){
                        Spacer()
                        Image("apple").resizable().aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                        Image("cherry")
                            .resizable().aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                        Image("coin")
                            .resizable().aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                        Spacer()
                    }
                    NavigationLink(destination: SlotsView(), tag: 1, selection: $selection){
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
                    
                    Spacer()
                }
                
            }
        
            }.accentColor(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
