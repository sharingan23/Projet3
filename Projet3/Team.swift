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
    var game: Game?
    
    init() {
    
    selectTeamName()
    
    }
    
    func selectTeamName () {
        print("Type your team name please")
        let name = readLine()
        if let name = name {
            self.name = name
        }
        
    }
    

    
    
    //Check if the character name is already on the team
    
    func checkCharactersName(checkname :String) -> Bool {
        for personnage in members {
            if personnage.name == checkname {
                print("nom deja existant,saisir un autre nom")
                return false
            }
            
        }
        return true
    }

    

        
        
        //The player choose his character name
        
        func createCharactersName() -> String {
            
            let name = readLine()
            
            if game!.checkCharactersName(name: name!){
                 return name!
            
            }
            return createCharactersName()
        }
    
    func createCharacter () -> GameCharacter {
        
        //The player choose his character type
        
        print("Please choose your Character for \(name) \n For Fighter type 1\n For Mage type 2\n For Colossus type 3\n For Dwarf type 4\n")
        
        let choiseNum = Int(readLine()!)
        
        if let choiseNumInt = choiseNum {
            
            switch choiseNumInt {
            case 1:
                print("You choised Fighter , please choose his name")
                
                
                
                return Fighter(name: createCharactersName())
                
            case 2:
                print("You choised Mage , please choose his name")
                
                
                
                return Mage(name: createCharactersName())
                
            case 3:
                print("You choised Colossus , please choose his name")
                
                
                
                return Colossus(name: createCharactersName())
                
            case 4:
                print("You choised Dwarf , please choose his name")
                
                
                
                return Dwarf(name: createCharactersName())
                
                
                
                
                
                
            default:
                print("Type 1,2,3 or 4")
                return createCharacter()
            }
            
        }
        return createCharacter()
    }

    
           
        //Add the character to team
    func addCharacterToTeam (charac: GameCharacter) {
        self.members = members + [charac]
    }
    
    func createCharacters () {
        addCharacterToTeam(charac: createCharacter())
        addCharacterToTeam(charac: createCharacter())
        addCharacterToTeam(charac: createCharacter())
    }
    
    
    func infoTeam () {
        for personnage in self.members {
            if let mage = personnage as? Mage{
                print("The team \(self.name) is composed of Mage named \(mage.name) with \(mage.hp) helth points, do \(mage.damage) hp of damage and heal \(mage.heal) health points\n")
                
            }
            
            if let fighter = personnage as? Fighter {
                print("The team \(self.name) is composed of Fighter named \(fighter.name) with \(fighter.hp) helth points, do \(fighter.damage) hp of damage\n")
                
            }
            if let colossus = personnage as? Colossus {
                print("The team \(self.name) is composed of Colossus named \(colossus.name) with \(colossus.hp) helth points, do \(colossus.damage) hp of damage\n")
            }
            else{
                print("The team \(self.name) is composed of Dwarf named \(personnage.name) with \(personnage.hp) helth points, do \(personnage.damage) hp of damage\n")
            }
        }
    }
    
    func chooseCharacter() -> GameCharacter{
        print("Please choose your Character you want to play thise round,type his name")
        
        let name = readLine()
        
        for personnage in members{
            
            if name == personnage.name{
                return personnage
            }
        }
        print("Please type his correct name")
        return chooseCharacter()
    }
        
    
    
}
