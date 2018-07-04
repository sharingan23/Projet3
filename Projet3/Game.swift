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
        //Initialization of properties of game
        self.team1 = Team()
        self.team2 = Team()
    
        //Initialization of game in team
        
        team1.game = self
        team2.game = self
        
        
        
    }
    
   
    //Check if the two teams have already the name
    func checkCharactersName(name: String) -> Bool {
        return team1.checkCharactersName(checkname: name) && team2.checkCharactersName(checkname: name)
        
    }
    
    
    
    func infoTeam () {
        for personnage in team1.members {
            if let mage = personnage as? Mage{
                print("The team \(team1.name) is composed of Mage named \(mage.name) with \(mage.hp) helth points, do \(mage.damage) hp of damage and heal \(mage.heal) health points\n")
                
            }
            
            if let fighter = personnage as? Fighter {
                print("The team \(team1.name) is composed of Fighter named \(fighter.name) with \(fighter.hp) helth points, do \(fighter.damage) hp of damage\n")
                
            }
            if let colossus = personnage as? Colossus {
                print("The team \(team1.name) is composed of Colossus named \(colossus.name) with \(colossus.hp) helth points, do \(colossus.damage) hp of damage\n")
            }
            else{
                print("The team \(team1.name) is composed of Dwarf named \(personnage.name) with \(personnage.hp) helth points, do \(personnage.damage) hp of damage\n")
            }
        }
    }
}
