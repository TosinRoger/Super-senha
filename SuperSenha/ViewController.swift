//
//  ViewController.swift
//  SuperSenha
//
//  Created by Roger Tosin on 02/04/18.
//  Copyright © 2018 Roger Tosin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPassword: UITextField!
    @IBOutlet weak var tfCharacters: UITextField!
    @IBOutlet weak var switchLetters: UISwitch!
    @IBOutlet weak var switchNumbers: UISwitch!
    @IBOutlet weak var switchCapitalLetters: UISwitch!
    @IBOutlet weak var switchSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordViewController = segue.destination as! PasswordsViewController
        if let numberOfPassword = Int(tfTotalPassword.text!) {
                passwordViewController.numberOfPasswords = numberOfPassword
        }
        if let numberOfCharacters = Int(tfCharacters.text!) {
            passwordViewController.numberOfCharacters = numberOfCharacters
        }
        passwordViewController.useLetters           = switchLetters.isOn
        passwordViewController.useNumber            = switchNumbers.isOn
        passwordViewController.useCapitalLetters    = switchCapitalLetters.isOn
        passwordViewController.useSpecialCharacters = switchSpecialCharacters.isOn
        
        // todos os campos perdem o foco e o teclado e fechado caso esteja aberto
        view.endEditing(true)
    }

}

