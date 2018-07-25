//
//  Validations.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 24/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class Validations: NSObject {
    
    /// Valida se a String inserida possui apenas Numeros.
    ///
    /// - Parameter text: String
    /// - Returns: Bool
    static func ifStringContainsOnlyDecimalNumbers(text: String) -> Bool{
        return Verify.verifyIfIsOnlyNumbers(text: text)
    }
}
