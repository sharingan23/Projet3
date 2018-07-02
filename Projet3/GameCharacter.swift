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
    
    // Constructors
    
    init (name :String, hp : Int, damage : Int) {
        
        self.name = name
        self.hp = hp
        self.damage = damage
        
    }
}

class Fighter : GameCharacter {
    
    
    init(name: String) {
        super.init(name : name, hp: 100, damage : 10)
    }
}

