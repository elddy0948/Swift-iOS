//
//  ContentView.swift
//  SwiftUI_Stacks
//
//  Created by 김호준 on 2020/06/09.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let chelsea: [String] = ["hazard","pulisic","kante"]
    var body: some View {
        ScrollView{
            HStack {
                ForEach(chelsea, id: \.self) {
                    player in Image(player)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .fixedSize(horizontal: true, vertical: true)
                    
                }
            }
            VStack {
                ForEach(chelsea, id: \.self) {
                    player in Image(player)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .fixedSize(horizontal: true, vertical: true)
                    
                }
            }
            ZStack {
              ForEach(chelsea, id: \.self) {
                    player in Image(player)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .fixedSize(horizontal: true, vertical: true)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}