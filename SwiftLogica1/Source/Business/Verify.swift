//
//  Verify.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 24/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class Verify: NSObject {
    
static func verifyIfIsOnlyNumbers(text:String?) -> Bool {
        let allowedCharaters = CharacterSet.decimalDigits
        let charactersSet = CharacterSet(charactersIn:text!)
       return allowedCharaters.isSuperset(of: charactersSet)
    }
}
