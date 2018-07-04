//
//  main.swift
//  projet3
//
//  Created by Vigneswaranathan Sugeethkumar on 26/06/2018.
//  Copyright © 2018 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation

//Create a game
var game = Game()


//test of createCharacters
game.team1.createCharacters()
game.team2.createCharacters()

//test of infoTeam
game.team1.infoTeam ()
game.team2.infoTeam()

print("\(game.team1.members[0].name)")
print("\(game.team1.members[1].name)")
print("\(game.team1.members[2].name)")

print("\(game.team2.members[0].name)")
print("\(game.team2.members[1].name)")
print("\(game.team2.members[2].name)")

    
    
    
    








    












