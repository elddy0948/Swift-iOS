//
//  CalculatePrimeOperation.swift
//  Concurrency Practice
//
//  Created by 김호준 on 2020/08/04.
//  Copyright © 2020 김호준. All rights reserved.
//

import Foundation

class CalculatePrimeOperation: Operation {
    override func main() {
        for number in 0...1_000_000 {
            let isPrimeNumber = isPrime(number: number)
            print("\(number) is Prime : \(isPrimeNumber)")
        }
    }
    func isPrime(number: Int) -> Bool {
        if number <= 1 { return false }
        if number <= 3 {return true }
        
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}
