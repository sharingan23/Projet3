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
    // variables for stats
    var numOfRound = 0
    var numOfHeal = 0
    
    //Constructor
    
    init (){
        //Initialization of properties of game
        playerTurn = true
        self.weapons = [Knife(),WoodenSword(),Axe(), TitaniumSword()]
        self.healingWeapon = [Potion(),ArcHeal(),PainKiller()]
        self.team1 = Team()
        self.team2 = Team()
        
        //Initialization of game in team
    }
    
    
    func chestOrNot(player: GameCharacter) {
       let num = Int(arc4random_uniform(30))
        //Check if he is a Mage
        if let mage = player as? Mage {
            // Chest Appear or not
            if num < 4 {
                mage.heal = healingWeapon[num].heal
                print("New chest appear and the player was equiped and now he heal \(mage.heal) hp")
                 // Bonus : Increase of heal power
                } else if num < 8 {
                mage.heal = mage.heal*2
                print("\(mage.name) get power of God and his healing power is now increased,and now he heal \(mage.heal) hp :)")
                    // Bonus :Decrease of heal power
                    } else if num < 12 {
                    mage.heal = mage.heal/2
                    print("\(mage.name) is sick and his healing power is now decreased,and now he heal \(mage.heal) hp :(")
                    }
        }else if num < 4 {
            player.damage = weapons[num].damage
            print("New chest appear and the player was equiped and now he do \(player.damage) hp of damage")
                // Bonus : Increase of damage
                } else if num < 8 {
                    player.damage = player.damage*2
                    print("\(player.name) get power of God and his damage is now increased,and now he do \(player.damage) hp of damage")
                // Decrease of damage
                    } else if num < 12 {
                        player.damage = player.damage/2
                        print("\(player.name) is sick and his damage is now decreased,and now he do \(player.damage) hp of damage")
                        }
    }
        
    func fight() {
        // Check if all character of team 1 or Team 2 are dead to end the fight
        if team1.members.isEmpty {
            print("It is the end of the fight, Team \(team2.name) win the game, Congrats !")
            print("The fight had \(numOfRound) round,and the mages healed \(numOfHeal) times in the whole game")
            return
            
        } else if team2.members.isEmpty {
            print("It is the end of the fight, Team \(team1.name) win the game, Congrats !")
            print("The fight had \(numOfRound) round,and the mages healed \(numOfHeal) times in the whole game")
            return
        }
        
        //Interve players
        var player1 = team2
        var player2 = team1
        // Check Whose turn, true player 1 turn else PLayer 2 turn
        if playerTurn {
            player1 = team1
            player2 = team2
        }
        print("Please Team: \(player1.name) choose your Character to send in Arena")
        // Ask to CHoose Player to play
        let player = player1.chooseCharacter()
        
        print("you choosed: \(player.name)\n")
        //Check if he is a Mage
        if let mage = player as? Mage {
            print("\(player.name) is a Mage\n")
            //chest Apper or God event or nothing happens
            chestOrNot(player: mage)
            
            print("To heal type 1 or To attack type 2?\n")
            // If he is a Mage Ask if the player want to heal or attack
            if mage.mageAction() {
                print("Please type the name of your character you want to heal")
                // Ask to choose the player u want to Heal
                let playerToHeal = player1.chooseCharacter()
                mage.healcharacter(character: playerToHeal)
                //Info of Characters
                player1.infoTeam()
                player2.infoTeam()
                // Count number of turn
                numOfRound += 1
                numOfHeal += 1
                //Change turn and give hand to Team 1 or Team 2
                if playerTurn == true {
                    playerTurn = false
                } else {
                    playerTurn = true
                }
                self.fight()
            }else {
            
                print("Please type the name of the character you want to attack\n")
                let playerToAttack = player2.chooseCharacter()
                mage.attack(target: playerToAttack)
                //Delete the character from array if he is dead
                player2.deleteDeadCharacter()
                player1.infoTeam()
                player2.infoTeam()
                //Count number of turn
                numOfRound += 1
                if playerTurn == true {
                    playerTurn = false
                } else {
                    playerTurn = true
                }
                self.fight()
                

            }
        }
        //If other than Mage ask to choose enemy character to attack
            // Check if Check appear or not
            chestOrNot(player: player)
        
        print("Please type the name of the character you want to attack\n")
        let playerToAttack = player2.chooseCharacter()
        
        player.attack(target: playerToAttack)
        player2.deleteDeadCharacter()
        player1.infoTeam()
        player2.infoTeam()
        // Count number of turn
        numOfRound += 1
        if playerTurn == true {
            playerTurn = false
        } else {
            playerTurn = true
        }
        self.fight()

    }
} 
