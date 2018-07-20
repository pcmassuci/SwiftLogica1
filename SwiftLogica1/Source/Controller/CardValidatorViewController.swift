//
//  CardValidatorViewController.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 19/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit
let valid = "valido"
let invalid = "invalido"

class CardValidatorViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var cardView: CardValidatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewDidLoad()
    }
    
    private func setViewDidLoad(){
        cardView.validateLabel.text = ""
    }
    
    @IBAction func validateNumber(_ sender: Any) {
        let manager = CardValidateManager()
        let isACardNumber =
            manager.validateCardNumberManger(card:cardView.cardTextField.text!)
        if isACardNumber {
            cardView.validateLabel.text = valid
        } else {
            cardView.validateLabel.text = invalid
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        cardView.validateLabel.text = emptyString
    }
}


