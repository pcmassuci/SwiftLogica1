//
//  RomanConverterViewController.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

let kMaxValueOfNumber = 3888

class RomanConverterViewController: UIViewController {
    @IBOutlet var romanView: RomanConverterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    func setupViewDidLoad() {
        romanView.decimalNumber.delegate = self
    }
    
    @IBAction func convertNumberToRoman(_ sender: Any) {
        let decimalText = romanView.decimalNumber.text!
        if decimalText != DefaultStrings.emptyString {
            let numberText = decimalText
            let romanNumber = RomanManager.convertRomanNumberManger(number: numberText)
            romanView.romanNumberLabel.text = romanNumber
        } else {
            showAlert(message: "")
        }
    }
    
    private func showAlert(message:String) {
        let alert = UIAlertController(title: InteractionStrings.emptyField, message: InteractionStrings.sendValidNumber, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:DefaultStrings.ok , style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension RomanConverterViewController: UITextFieldDelegate {
 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == romanView.decimalNumber {
            return decimalTextFieldValidations(textField.text! + string)
        }
        return true
    }
    
    private func decimalTextFieldValidations(_ text: String) ->Bool {
        if let intValue = Int(text) {
              return intValue <= kMaxValueOfNumber
        }
     return false
    }
    
}
