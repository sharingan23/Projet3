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
    var weapon : Weapon
    var heal = 0
    
    // Constructors n initialization of name, hp ,damage and type
    
    init (name :String, hp : Int, weapon: Weapon, damage : Int, heal: Int) {
        
        self.name = name
        self.hp = hp
        self.weapon = weapon
        self.damage = damage
        self.heal = heal
    }
    
    func attack(target: GameCharacter) {
        target.hp = target.hp - damage
        print("\(target.name) took \(damage) hp of damage from \(name), he have now : \(target.hp) hp\n")
    }
}

class Fighter : GameCharacter {
    
    
    init(name: String) {
        super.init(name : name, hp: 100, weapon: Knife(), damage : 150,heal: 0)
        self.damage = damage + weapon.damage
    }
}
    

class Mage : GameCharacter {

    init(name: String) {
        
        super.init(name: name, hp: 70,weapon: PainKiller(), damage: 2,heal: 10 )
        self.heal = heal + weapon.heal
        self.damage = damage + weapon.damage
    }
    
    func mageAction() -> Bool {
        let num = Int(readLine()!)
        
        if let num = num {
        
            switch num {
            case 1:
            return true
            
            
            case 2:
            return false
            
            
            default:
            print("Please type 1 or 2")
            return mageAction()
            }
        }
        return mageAction()
    }

    
    func healcharacter (character: GameCharacter) {
        character.hp = character.hp + heal
        print("\(character.name) was healed \(heal) hp, now have \(character.hp) hp\n")
    }
}

    
    class Colossus : GameCharacter {
        init(name: String) {
            super.init(name: name, hp: 130, weapon: Axe(), damage: 5, heal: 0)
            self.damage = damage + weapon.damage
        }
        
    }
    
    class Dwarf: GameCharacter {
        init(name: String) {
            super.init(name: name, hp: 60, weapon: WoodenSword(), damage: 30,heal: 0)
            self.damage = damage + weapon.damage
        }
    }



    



