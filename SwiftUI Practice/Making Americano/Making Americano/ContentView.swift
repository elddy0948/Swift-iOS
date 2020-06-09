//
//  ContentView.swift
//  Making Americano
//
//  Created by 김호준 on 2020/06/09.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //whenever value changes view will be re-render
    @State private var orderCount = 0
    @State private var waterPercent = 0.0
    
    //binding의 개념
    
    var body: some View {
        VStack {
//            Stepper(onIncrement: {
////              + 버튼을 눌렀을 때
//                self.orderCount += 1
//            }, onDecrement: {
////                - 버튼을 눌렀을 때
//            }){
//                Text("Making Americano")
//            }
            Image("coffee")
            Slider(value: $waterPercent)
            Text("Water : \(Int(waterPercent * 100))% / Shot : \(100 - Int(waterPercent * 100))%")
                .padding(.bottom,100)
            Stepper("How many?", value: $orderCount)
            Text("\(orderCount) Americano")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
