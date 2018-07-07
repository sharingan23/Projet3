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
    var playerTurn : Bool
    
    //Constructor
    
    init (){
        //Initialization of properties of game
        playerTurn = true
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
    
    func fight(){
        // Chech if all character of team 1 are dead ou Team 2
        if team1.members.isEmpty {
            print("C'est la fin du combat, l'equipe \(team2.name) a gagné, bravo !")
        } else if team2.members.isEmpty {
            print("C'est la fin du combat, l'equipe \(team1.name) a gagné, bravo !")
        }
        // Check Whose turn
        if playerTurn {
        print("Please Team: \(team1.name) choose your Character to send in Arena")
        // Ask to CHoose Player to play
        let player = team1.chooseCharacter()
        
        print("you choosed: \(player.name)\n")
        //Chech if he is a Mage
        if ((player as? Mage) != nil) {
            print("\(player.name) is a Mage, To heal type 1 or To attack type 2?\n")
            
            let mage = player as! Mage
            // If he is a Mage Ask if the player want to heal or attack
            if mage.mageAction() {
                print("Please type the name of your character you want to heal")
                // Ask to choose the player u want to Heal
                let playerToHeal = team1.chooseCharacter()
                mage.healcharacter(character: playerToHeal)
                //Info of Characters
                team1.infoTeam()
                team2.infoTeam()
                //Change turn and give hand to player 2
                playerTurn = false
                self.fight()
            }
            else {
                print("Please type the name of the character you want to attack\n")
                let playerToAttack = team2.chooseCharacter()
                mage.attack(target: playerToAttack)
                //Delete the character from array if he is dead
                team2.deleteDeadCharacter()
                team1.infoTeam()
                team2.infoTeam()
                playerTurn = false
                self.fight()
                

            }
            
            
        }
        //If other than Mage ask to choose enemy character to attack
        print("Please type the name of the character you want to attack\n")
        let playerToAttack = team2.chooseCharacter()
        
        player.attack(target: playerToAttack)
        team2.deleteDeadCharacter()
        team1.infoTeam()
        team2.infoTeam()
        playerTurn = false
        self.fight()
        
        }else {
                // Player 2 turn
                print("Please Team: \(team2.name) choose your Character to send in Arena")
                let player = team2.chooseCharacter()
                
                print("you choosed: \(player.name)\n")
            
                if ((player as? Mage) != nil) {
                    print("\(player.name) is a Mage, To heal type 1 or To attack type 2?\n")
                    
                    let mage = player as! Mage
                    // Ask to heal or attack
                    if mage.mageAction() {
                        let playerToHeal = team2.chooseCharacter()
                        mage.healcharacter(character: playerToHeal)
                        team1.deleteDeadCharacter()
                        team2.infoTeam()
                        team1.infoTeam()
                        playerTurn = true
                        self.fight()
                    }
                    else {
                        // mage attack
                        print("Please type the name of the character you want to attack\n")
                        let playerToAttack = team1.chooseCharacter()
                        mage.attack(target: playerToAttack)
                        team1.deleteDeadCharacter()
                        team2.infoTeam()
                        team1.infoTeam()
                        playerTurn = true
                        self.fight()
                        
                        
                    }
                    
                    
                }
                // If other character than mage, attack
                print("Please type the name of the character you want to attack\n")
                let playerToAttack = team1.chooseCharacter()
                
                player.attack(target: playerToAttack)
                team1.deleteDeadCharacter()
                team2.infoTeam()
                team1.infoTeam()
                playerTurn = true
                self.fight()

        }


    }
}
