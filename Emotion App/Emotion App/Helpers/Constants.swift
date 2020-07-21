//
//  Constants.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/19.
//  Copyright © 2020 김호준. All rights reserved.
//

import Foundation


class Constants {
    struct ViewController {
        static let homeTabBar: String = "HomeTabBar"
    }
    struct Feeling {
        var happy = "Happy"
        var sad = "Sad"
        var soso = "Soso"
        var bad = "Bad"
    }
    struct Firebase {
        static var userCollection = "users"
        static var firstName = "firstName"
        static var lastName = "lastName"
        static var uid = "uid"
    }
}
