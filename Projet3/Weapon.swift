//
//  weapon.swift
//  Projet3
//
//  Created by Vigneswaranathan Sugeethkumar on 07/07/2018.
//  Copyright © 2018 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation

class Weapon {
    var damage = 0
    var heal = 0
    init(damage: Int, heal: Int) {
        self.damage = damage
        self.heal = heal
    }
}

class Knife : Weapon {
    init(){
        super.init(damage: 10, heal: 0)
    }
}

class Axe : Weapon {
    init(){
        super.init(damage: 25, heal: 0)
    }
}

class WoodenSword : Weapon {
    init(){
        super.init(damage: 2, heal: 0)
    }
}

class TitaniumSword : Weapon {
    init(){
        super.init(damage: 50, heal: 0)
    }
}

class Potion : Weapon {
    init(){
        super.init(damage: 0, heal: 50)
    }
}

class ArcHeal : Weapon {
    init(){
        super.init(damage: 0, heal: 40)
    }
}
class PainKiller : Weapon {
    init(){
        super.init(damage: 0, heal: 15)
    }
}








