//
//  ContentView.swift
//  ToggleAndDatePicker
//
//  Created by 김호준 on 2020/06/10.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var isCoffeTakeOut: String {
        return "Americano " + (takeOutOrNot ? "TakeOut!" : "No TakeOut!")
    }
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
    
    @State private var takeOutOrNot: Bool = false
    @State private var pickedDate: Date = Date()
    
    var body: some View {
        VStack {
            Toggle("TakeOut or Not?", isOn: $takeOutOrNot)
            Text(isCoffeTakeOut)
                .foregroundColor(takeOutOrNot ? .green : .red)
                .fontWeight(takeOutOrNot ? .heavy : .light)
            
//            Toggle(isOn: $takeOutOrNot) {
//                VStack {
//                    Image ...
//                    Text ...
//                }
//            }  --> 이렇게도 사용 가능하다.
            
            DatePicker(selection: $pickedDate, displayedComponents: [.date]) {
                Text("Select Date!")
            }
            Text(dateFormatter.string(from: pickedDate))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
