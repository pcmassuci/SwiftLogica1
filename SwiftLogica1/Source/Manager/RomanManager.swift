//
//  RomanManager.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class RomanManager: NSObject {
    
    /// Converte um numero decimal em algorismo romano
    ///
    /// - Parameter number: Numero digitado no campo
    /// - Returns: Numero romano convertido
    static func convertRomanNumberManger(number:String) -> String {
    return RomanConvert.getRomans(number: number)
    }
    
    static func convertDecimalToRoman(_ number:Int) -> String {
        return RomanConvertV2.convertToRomanNumbersFromDecimalNumber(number)
    }

}
