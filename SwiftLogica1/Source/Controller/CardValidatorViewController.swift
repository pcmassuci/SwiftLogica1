//
//  CardValidatorViewController.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit
class CardValidatorViewController: UIViewController{
    @IBOutlet var cardView: CardValidatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setviewWillAppear(animated)
    }
    
    private func setviewWillAppear(_ animated: Bool) {
        cardView.validateLabel.text = ""
    }
    
    @IBAction func validateNumber(_ sender:Any) {
        let manager = CardValidateManager()
        let isACardNumber =
            manager.validateCardNumberManger(card:cardView.cardTextField.text!)
        if isACardNumber {
            cardView.validateLabel.text = InteractionStrings.valid
        } else {
            cardView.validateLabel.text = InteractionStrings.invalid
        }
    }
}

extension CardValidatorViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validateField(textField.text! + string)
    }
    
    private func validateField(_ string:String) -> Bool {
        if let _ = Int(string) {
            return true
        }
        
        return false
    }
    
}


