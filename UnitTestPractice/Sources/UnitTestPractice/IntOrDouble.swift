//
//  File.swift
//  
//
//  Created by 김호준 on 2020/12/16.
//

import Foundation


public extension FloatingPoint {
    var isInteger: Bool? {
        if self == 0 {
            return nil
        }
        else if self == rounded() {
            //it's Integer
            return true
        }
        //it's Double
        return false
    }
}
