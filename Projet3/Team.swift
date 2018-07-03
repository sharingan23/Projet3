//
//  Team.swift
//  projet3
//
//  Created by Vigneswaranathan Sugeethkumar on 26/06/2018.
//  Copyright © 2018 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation

// Class Team

class Team {
    var name : String = "nom"
    var members :[GameCharacter] = []
    
    init() {
    
    selectTeamName()
    createCharactersType()
    
    }
    
    func selectTeamName () {
        print("Type your team name please")
        let name = readLine()
        if let name = name {
            self.name = name
        }
        
    }
    
    func createCharactersType () {
        //The player choose his character type
        
        print("Please choose your Character\n  For Fighter type 1\n For Mage type 2\n For Colossus type 3\n For Dwarf type 4\n")
        
        let choiseNum = Int(readLine()!)
        
        if let choiseNumInt = choiseNum {
            
            switch choiseNumInt {
            case 1:
                print("You choised Fighter , please choose his name")
                
                checkCharactersName(checkname: createCharactersName())
                
                
                    
                    
                    
            default:
                print("Type 1")
            }
                
            }
        }
        
        
        //The player choose his character name
        
        func createCharactersName() -> String {
            
            let name = readLine()
            
            if let nameString = name {
                 return nameString
            }
            return "Default"
    }
           
        
            
    
    
        
       
        


        
       
        
        //Check if the character name is already on the team
        
    func checkCharactersName(checkname :String) {
            for personnage in members {
                if personnage.name == checkname {
                    print("nom deja existant")
                } else {
                    print("Ajoutez personnage")
                    
                }
            }
        }
        
        //Add the character to team
    
        
    
    
}
