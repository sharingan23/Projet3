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
    
}
