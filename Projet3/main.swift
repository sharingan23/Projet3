//
//  main.swift
//  projet3
//
//  Created by Vigneswaranathan Sugeethkumar on 26/06/2018.
//  Copyright © 2018 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation

    
print("Choose your character\n For Fighter type 1\n For Mage type 2\n For Colossus type 3\n For Dwarf type 4/n")


let inputNumber = Int(readLine()!)
if let inputNumber = inputNumber {
    switch inputNumber {
    case 1:
        print("You choise Fighter\n")
        print("Please type your Fighter name\n")
        let name = String(readLine()!)
        
        var fighter = Fighter(name: name)
        
        
    case 2:
        print("You choise Mage")
    
    case 3:
        print("You choise Colossus")
    
    case 4:
        print("You choise Dwarf")
        
    default:
        print("Please types 1,2,3 or 4")
        
    }
    
}







    












