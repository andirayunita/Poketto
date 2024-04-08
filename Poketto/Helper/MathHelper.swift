//
//  MathHelper.swift
//  Poketto
//
//  Created by Andira Yunita on 06/04/24.
//

import Foundation

struct MathHelper {
    // MARK: - Fibonnaci
    func fibonacciSequence(at index: Int) -> Int {
        if index <= 1 {
            return index
        }
        
        var fibonacci = [0, 1]
        for _ in 2...index {
            fibonacci.append(fibonacci[fibonacci.count - 1] + fibonacci[fibonacci.count - 2])
        }
        
        return fibonacci.last!
    }
    
    // MARK: - isPrimeNumber
    func isPrimeNumber() -> Bool {
        let randomNumber = Int.random(in: 1...10)
        var isPrime = true
        
        if randomNumber < 2 {
            isPrime = false
        } else {
            for i in 2...(randomNumber / 2) {
                if randomNumber % i == 0 {
                    isPrime = false
                    break
                }
            }
        }
        return isPrime
    }
    
    // MARK: - isCatched probability
    func isCatched() -> Bool {
        let randomNumber = Int.random(in: 1...10)
        let percentage = (Double(randomNumber/10) * 100)
        print("\(percentage)")
        return percentage >= 50
    }
}
