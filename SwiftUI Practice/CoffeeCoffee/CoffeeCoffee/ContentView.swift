//
//  ContentView.swift
//  CoffeeCoffee
//
//  Created by 김호준 on 2020/06/09.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack {
                Image("Holuck")
                Button(action: {
                    print("Hi there!")
                }) {
                    HStack {
                        Image(systemName: "hand.raised")
                        Text("Welcome!")
                        Image(systemName: "hand.raised")
                    }
                    .font(.title)
                    .foregroundColor(.primary)
                    .shadow(radius: 10)
                }
                Button(action: {
                    print("Hello")
                }) {
                    VStack {
                        Image("coffee")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 90, height: 90)
                            .shadow(radius: 10)
                            .padding()
                        
                        Text("Order Americano")
                            .font(Font.system(.headline, design: .rounded))
                            .foregroundColor(.primary)
                            .padding([.leading
                                , .trailing], 10)
                            .padding([.top, .bottom],5)
                            .background(Color.purple)
                            .cornerRadius(10, antialiased: false)
                            .shadow(radius: 10)
                            .rotationEffect(.degrees(-10))
                    }
                }
            }
            Spacer()
            .layoutPriority(1)
        }
        .background(Color.orange)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
