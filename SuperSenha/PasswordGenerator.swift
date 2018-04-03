//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Roger Tosin on 02/04/18.
//  Copyright © 2018 Roger Tosin. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumber: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvxwyz"
    private let special = "!@#$%^&*()_-+=~`|[]{}'.,<>;:/?"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumber: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumber = useNumber
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe = ""
        
        if useLetters {
            universe += letters
        }
        if useNumber {
            universe += numbers
        }
        if useSpecialCharacters {
            universe += special
        }
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let arrayUniverse = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(arrayUniverse.count)))
                password += String(arrayUniverse[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
