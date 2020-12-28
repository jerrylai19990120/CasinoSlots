//
//  CardView.swift
//  CasinoSlots
//
//  Created by Jerry Lai on 2020-12-27.
//  Copyright © 2020 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol: String
    @Binding var bgColor: Color
    
    var body: some View {
        Image(symbol).resizable().aspectRatio(1, contentMode: .fit).background(bgColor.opacity(0.5)).cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"), bgColor: Binding.constant(Color.white))
    }
}
