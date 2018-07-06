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
        print("Type your team name please:")
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
            //Use of function checkCharactersName of class game , NOT function of class Team
            if game!.checkCharactersName(name: name!){
                 return name!
            
            }
            return createCharactersName()
        }
    
    func createCharacter () -> GameCharacter {
        
        //The player choose his character type
        
        print("Please choose your Character for \(name) : \n -For Fighter type 1\n -For Mage type 2\n -For Colossus type 3\n -For Dwarf type 4\n")
        
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
        //3 character created
        addCharacterToTeam(charac: createCharacter())
        addCharacterToTeam(charac: createCharacter())
        addCharacterToTeam(charac: createCharacter())
    }
    
    
    func infoTeam () {
        //Loop of members
        for personnage in self.members {
            if let mage = personnage as? Mage{
                print("Team \(self.name) : •Mage - Name: \(mage.name) - HP: \(mage.hp) hp - Damage: \(mage.damage) hp - Heal: \(mage.heal) hp\n")
                
            }
            
            if let fighter = personnage as? Fighter {
                print("Team \(self.name) : •Fighter - Name : \(fighter.name) - HP: \(fighter.hp) hp - Damage: \(fighter.damage) hp\n")
                
            }
            if let colossus = personnage as? Colossus {
                print("Team \(self.name) : •Colossus - Name : \(colossus.name) - HP: \(colossus.hp) hp - Damage \(colossus.damage) hp\n")
            }
            if let dwarf = personnage as? Dwarf{
                print("Team \(self.name) : •Dwarf - Named : \(dwarf.name) - HP: \(dwarf.hp) hp - Damage \(dwarf.damage) hp\n")
            }
        }
    }
    
    func chooseCharacter() -> GameCharacter{
        
        //Ask to type for choose character
        let name = readLine()
        
        // Search if typed personnage is on team
        for personnage in members{
            
            if name! == personnage.name{
                return personnage
            }
        }
        
        // Ask until the user type a correct name of his character on team
        print("Please type his correct name")
        return chooseCharacter()
    }
    
    func deleteDeadCharacter (){
        var index = 0
        for personnage in members{
            if personnage.hp <= 0{
                
                members.remove(at: index)
                print("\(personnage.name) is dead :(")
                
            }
        index += 1
        }
        
    }
    
    func endOfthegame() {
        if members.isEmpty {
            
        }
    }

}
