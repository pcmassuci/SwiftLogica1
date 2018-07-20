//
//  LuhnAlgorithm.swift
//  Luhn
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class LuhnAlgorithm: NSObject {
    
    /// Metodo utilizado para validar o algoritimo de Luhn
    ///
    /// - Parameter card: Cartao inserido no campo
    /// - Returns: Booleano indicando se é um cartao valido.
    func luhnAlgorithm(card:String) -> Bool{
        var array = separeDigit(card)
        let verifyDigit = array.popLast()
        array = convertArray(array: array.reversed())
        let sumOfArray = sumArray(arrayOfNumbers: array) * 9
        array = separeDigit(String(sumOfArray))
        let finalNumber = array.popLast()!
        if finalNumber == verifyDigit {
            return true
        }
        return false
    }
    
    private func separeDigit(_ card:String )->[Int] {
        var array = [Int]()
        for digit in card{
            let someString = String(digit)
            if let someInt = Int(someString){
                array.append(someInt);
            }
        }
        return array
    }
    
    private func convertArray(array:[Int])->[Int]{
        var mutableArray = array
        for i in 0 ..< mutableArray.count {
            if (i%2) == 0 {
                var number = mutableArray[i] * 2
                if number >= 10 {
                    number = nineTest(String(number))
                }
                mutableArray[i] = number
            }
        }
        return mutableArray;
    }
    
    private func sumArray(arrayOfNumbers:[Int]) -> Int {
        var sum = 0
        for number in arrayOfNumbers {
            sum += number
        }
        return sum
    }
    
    private func nineTest(_ char:String) -> Int {
        let array = separeDigit(char)
        let sum = sumArray(arrayOfNumbers: array)
        if sum < 10 {
            return sum
        }
        return nineTest(String(sum))
    }
    
}


