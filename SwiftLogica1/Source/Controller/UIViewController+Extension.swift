//
//  UIViewController+Extension.swift
//  SwiftLogica1
//
//  Created by Paulo Cesar Morandi Massuci on 26/07/2018.
//  Copyright © 2018 Paulo César Morandi Massuci. All rights reserved.
//

import UIKit


extension UIViewController {
    
    /// Funcao que faz o keyboard retornar.
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
