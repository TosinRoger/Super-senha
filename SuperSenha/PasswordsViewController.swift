//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Roger Tosin on 02/04/18.
//  Copyright © 2018 Roger Tosin. All rights reserved.
//

import UIKit
import Foundation

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumber: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumber: useNumber, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords() {
        
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }

    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
}
