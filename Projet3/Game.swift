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
    var weapons : [Weapon]
    var healingWeapon : [Weapon]
    
    //Constructor
    
    init (){
        //Initialization of properties of game
        playerTurn = true
        self.weapons = [Knife(),WoodenSword(),Axe(), TitaniumSword()]
        self.healingWeapon = [Potion(),ArcHeal(),PainKiller()]
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
    
    func chestOrNot() -> Int {
       let rand0To9 = Int(arc4random_uniform(8))
        
        if rand0To9 < 4 {
            return rand0To9
        }
        
        return rand0To9
    }
    
    func fight(){
        // Check if all character of team 1 are dead ou Team 2
        if team1.members.isEmpty {
            print("C'est la fin du combat, l'equipe \(team2.name) a gagné, bravo !")
        } else if team2.members.isEmpty {
            print("C'est la fin du combat, l'equipe \(team1.name) a gagné, bravo !")
        }
        // Check Whose turn, true player 1 turn else PLayer 2 turn
        if playerTurn {
        print("Please Team: \(team1.name) choose your Character to send in Arena")
        // Ask to CHoose Player to play
        let player = team1.chooseCharacter()
        
        print("you choosed: \(player.name)\n")
        //Check if he is a Mage
        if ((player as? Mage) != nil) {
            print("\(player.name) is a Mage\n")
            
            let mage = player as! Mage
            
            // Chest Appear or not
            let num = chestOrNot()
            if num < 4 {
                mage.heal = healingWeapon[num].heal
                print("New chest appear and the player was equiped and now he heal \(mage.heal) hp")
                }
            
            print("To heal type 1 or To attack type 2?\n")
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
            }else {
            
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
            // Check if Check appear or not
            let num = chestOrNot()
            if num < 4 {
                player.damage = weapons[num].damage
                print("New chest appear and the player was equiped and now he do \(player.damage) hp of damage")
            }
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
                    
                    let num = chestOrNot()
                    if num < 4 {
                        print("New chest appear and the player was equiped and now he heal \(mage.heal) hp")
                        mage.heal = healingWeapon[num].heal
                    }
                    
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
            
                // Check if Check appear or not
                let num = chestOrNot()
                if num < 4 {
                    player.damage = weapons[num].damage
                    print("New chest appear and the player was equiped and now he do \(player.damage) hp of damage")
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
