//
//  CardValidateManager.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class CardValidateManager: NSObject {
    
    /// Valida se o cartao é valido.
    ///
    /// - Parameter card: Cartao inserido no campo
    /// - Returns: Booleano que indica se o cartao é valido.
     func validateCardNumberManger(card:String) -> Bool {
        let luhn = LuhnAlgorithm()
        return luhn.luhnAlgorithm(card: card)
    }

}
