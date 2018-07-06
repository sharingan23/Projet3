//
//  GameCharacters.swift
//  projet3
//
//  Created by Vigneswaranathan Sugeethkumar on 26/06/2018.
//  Copyright © 2018 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation

//Class characters

class GameCharacter {
    
    var name: String = "nom"
    var hp: Int = 0
    var damage = 0
    var type: [GameCharacter] = []
    
    // Constructors n initialization iof name, hp ,damage and type
    
    init (name :String, hp : Int, damage : Int) {
        
        self.name = name
        self.hp = hp
        self.damage = damage
        
        
    }
    
    func attack(target: GameCharacter) {
        target.hp = target.hp - damage
        print("\(target.name) took \(damage) hp of damage from \(name), he have now : \(target.hp) hp\n")
    }
}

class Fighter : GameCharacter {
    
    
    init(name: String) {
        super.init(name : name, hp: 100, damage : 30)
    }
}

class Mage : GameCharacter {
    var heal = 0

    init(name: String) {
        
        super.init(name: name, hp: 70, damage: 2)
        self.heal = 10
    }
    
    func healcharacter (character: GameCharacter) {
        character.hp = character.hp + heal
        print("\(character.name) was healed \(heal) hp, now have \(character.hp) hp\n")
    }
    
    func mageAction() -> Bool {
        let num = Int(readLine()!)
        
        switch num! {
        case 1:
            return true
            
            
        case 2:
            return false
            
            
        default:
            print("Please type 1 or 2")
            return mageAction()
        }

    }
}

class Colossus : GameCharacter {
    init(name: String) {
        super.init(name: name, hp: 130, damage: 4)
    }
    
}

class Dwarf: GameCharacter {
    init(name: String) {
        super.init(name: name, hp: 60, damage: 35)
    }
}
    



