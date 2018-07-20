//
//  RomanConverterViewController.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit

class RomanConverterViewController: UIViewController {
    @IBOutlet var romanView: RomanConverterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func convertNumberToRoman(_ sender: Any) {
        let decimalText = romanView.decimalNumber.text!
        if decimalText != emptyString {
        let numberText = decimalText
        let romanNumber = RomanManager.convertRomanNumberManger(number: numberText)
        romanView.romanNumberLabel.text = romanNumber
        } else {
            showAlert()
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Campo vazio", message: "Por favor digite um numero valido!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
