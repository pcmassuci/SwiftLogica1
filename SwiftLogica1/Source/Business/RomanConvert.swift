//
//  RomanConvert.swift
//  Conversor romanos
//
//  Created by Paulo César Morandi Massuci on 09/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class RomanConvert: NSObject {
    static func getRomans(number:String) -> String{
        let intNumber = Int(number)!
        let thousands = intNumber / 1000
        let unit = intNumber % 1000
        var romanThousands = RomanConvert.getUntilNineHundred(number: thousands)
        let romanUnit = RomanConvert.getUntilNineHundred(number: unit)
        romanThousands = changeCharacterThousand(romanThousands)
        return romanThousands + romanUnit
    }
    
    
    private static func changeCharacterThousand (_ romanNumber: String) -> String {
        if romanNumber == "" {
            return romanNumber
        }
        var array = separeDigit(romanNumber)
        array = convertThousands(array)
        return array.joined()
    }

    private static func convertThousands(_ romamArray: [String])-> [String]{
        var array = romamArray
        let roman = array.popLast()
        if roman == "I" {
            array = convertThousands(array)
            array.append("M")
        }
        return array
    }
    
    private static func separeDigit(_ card:String )->[String] {
        var array = [String]()
        for digit in card{
            array.append(String(digit))
        }
        return array
    }
    
    private static func getUntilNineHundred(number:Int) -> String{
        var romanNumber = ""
        var auxNumber = number / 100
        if auxNumber == 9 {
            romanNumber = "CM"
            auxNumber = number % 100
            return romanNumber + getUntilNinety(number:auxNumber)
        }
        if auxNumber >= 5 {
            romanNumber = "D"
            auxNumber -= 5
        }
        if auxNumber == 4 {
            romanNumber = "CD"
        }
        if auxNumber > 0 {
            for _ in 1...auxNumber {
                romanNumber += "C"
            }
        }
        auxNumber = number % 100
        return romanNumber + getUntilNinety(number:auxNumber)
    }
    
    private static func getUntilNinety(number:Int) -> String {
        var romanNumber = emptyString
        var auxNumber = number
        auxNumber  = number
        
        if(auxNumber >= 90){
            romanNumber = RomanNumbers.ninety
            auxNumber = number - 90
            return romanNumber + getUntilNine(number: auxNumber)
        } else if(number <= 50) {
            return romanNumber + getUntilFifty(number:number)
        } else {
            auxNumber = (number - 50) / 10
            romanNumber = RomanNumbers.fifty
            for _ in 0..<auxNumber{
                romanNumber = romanNumber + RomanNumbers.ten
            }
            auxNumber = number % 10
        }
        return romanNumber + getUntilNine(number:auxNumber)
    }
    
    private static func getUntilFifty(number: Int) -> String {
        var romanNumber = emptyString
        var auxNumber = number
        if (number == 50){
            romanNumber = RomanNumbers.fifty
            auxNumber = number - 50
            return romanNumber + getUntilNine(number:auxNumber)
        } else if (number >= 40){
            romanNumber = RomanNumbers.fourty
            auxNumber = number - 40
            return romanNumber + getUntilNine(number:auxNumber)
        }
        return getUntilThirty(number:number)
    }
    
    
    private static func getUntilThirty(number: Int) -> String {
        var romanNumbers = emptyString
        var auxNumber = number / 10
        if(auxNumber != 0){
            for _ in 0..<auxNumber {
                romanNumbers = RomanNumbers.ten + romanNumbers
            }
        }
        auxNumber = number % 10
        return romanNumbers + getUntilNine(number:auxNumber)
    }
    
    private static func getUntilNine(number: Int) -> String {
        var romanNumbers = emptyString
        var auxNumber = number

        if number == 9{
            return RomanNumbers.nine
        } else if number >= 5 {
            romanNumbers = RomanNumbers.five
            auxNumber = number - 5
        }
        return romanNumbers + getFirsNumbers(number:auxNumber)
    }
    
    private static func getFirsNumbers(number:Int) -> String{
        var romanNumber = emptyString
        
        if number == 0 {
            return emptyString
        }else if number == 4 {
            return RomanNumbers.four
        }
        
        for _ in 0..<number {
            romanNumber = romanNumber + RomanNumbers.one
        }
        
        return romanNumber
    }
}
