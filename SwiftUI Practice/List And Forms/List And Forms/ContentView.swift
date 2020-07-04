//
//  ContentView.swift
//  List And Forms
//
//  Created by 김호준 on 2020/07/05.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSnackIndex = 0
    @State private var isOn = false
    @State private var anythingElse = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker (selection: $selectedSnackIndex, label: Text("Snack Type")) {
                        ForEach(0..<5) {
                            Text("\($0)")
                        }
                    }
                }
                Section {
                    Toggle(isOn: $isOn) {
                        Text("Toggle!")
                    }
                }
                Section {
                    TextField("AnyThing Else?", text: $anythingElse)
                }
            }
            .navigationBarTitle(Text("Navigation Title!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
