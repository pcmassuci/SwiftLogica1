//
//  RomanConvertV2.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 25/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class RomanConvertV2: NSObject {
    static let dictRoman = [1000 : [RomanNumbers.thousand, DefaultStrings.emptyString ,DefaultStrings.emptyString], 100 : [RomanNumbers.hundred, RomanNumbers.fiveHundred, RomanNumbers.thousand], 10 : [RomanNumbers.ten,RomanNumbers.fifty, RomanNumbers.hundred], 1 : [RomanNumbers.one,RomanNumbers.five, RomanNumbers.ten]]
    
    /// Convete um numero decimal em numerosromanos.
    ///
    /// - Parameter number:Int numero decimal.
    /// - Returns: String numero romano.
    static func convertToRomanNumbersFromDecimalNumber(_ number:Int) -> String{
        return convertRomans(number)
    }
    
    private static func convertRomans(_ number:Int) -> String {
        var romanNumbers = DefaultStrings.emptyString
        for (key, _) in dictRoman {
            romanNumbers += converterFromOrder(order: key, number: number)
        }
        return romanNumbers
    }
    
    private static func converterFromOrder(order:Int, number:Int) -> String{
        let myNumber = number % (order * 10)
        let dividendo = myNumber / order
        let  preRoman = getUntilNine(number: dividendo)
        return changeNumbers(preRoman, iFor: dictRoman[order]![0], vFor: dictRoman[order]![1], xFor: dictRoman[order]![2])
    }
    
    private static func changeNumbers(_ firstNumber:String, iFor:String, vFor:String, xFor:String) -> String{
        var newRoman = firstNumber.replace(target: RomanNumbers.ten, withString: xFor)
        newRoman = newRoman.replace(target: RomanNumbers.five, withString: vFor)
        newRoman = newRoman.replace(target: RomanNumbers.one, withString: iFor)
        return newRoman
    }
    
    private static func getUntilNine(number: Int) -> String {
        var romanNumbers = DefaultStrings.emptyString
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
        var romanNumber = DefaultStrings.emptyString
        
        if number == 0 {
            return DefaultStrings.emptyString
        }else if number == 4 {
            return RomanNumbers.four
        }
        for _ in 0..<number {
            romanNumber = romanNumber + RomanNumbers.one
        }
        
        return romanNumber
    }
}

extension String
{
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
