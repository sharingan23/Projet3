//
//  Game.swift
//  projet3
//
//  Created by Vigneswaranathan Sugeethkumar on 26/06/2018.
//  Copyright © 2018 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation

class Game {
    var team1 : Team
    var team2 : Team
    
    //Constructor
    
    init (){
        self.team1 = Team()
        self.team2 = Team()
        infoTeam ()
    }
    
    func infoTeam () {
        for personnage in team1.members {
            if personnage.type != "Mage"{
                print("L'equipe: \(team1.name) consitué de \(personnage.name) est un \(personnage.type)  avec \(personnage.hp) points de vie et fait \(personnage.damage) de dégats\n")

            }else{
                print("L'equipe \(team1.name) est \(personnage.name) est un \(personnage.type)  avec \(personnage.hp) points de vie et fait \(personnage.damage) et soigne \n")
                
            }

}
}
}
