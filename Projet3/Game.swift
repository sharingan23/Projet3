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
    
    func combat(){
        let player = team1.chooseCharacter()
        
        print("you choosed: \(player.name)\n")
        
        if ((player as? Mage) != nil) {
            print("\(player.name) is a Mage, To heal type 1 or To attack type 2?")
            
            let num = Int(readLine()!)
            
                switch num! {
                case 1:
                    print("Please Type a name of a character in your team to heal")
                    let playerToheal = team1.chooseCharacter()
                    healcharacter(character: playerToheal, healHp: 10)
                    
                default:
                    print("A completer")
                }
        }
 

    }
}

    

 
 
 
 

        

        
        
        


    

