//
//  Tournament.swift
//  Battle Bots (v.2)
//
//  Created by Ashley Saju on 1/27/22.
//

import Foundation
import Firebase


class Tournament {
    
    var colors: [String] = []
    var teamNames: [String] = []
    var teams: [[String]: [String]] = [:]
    var playerNames: [String] = []
    var winners: [String] = []

    
    init(){
        
        
    }
    init(colors: [String], teamNames: [String], teams: [[String]: [String]], playerNames: [String], winners: [String]){
        self.teams = [teamNames: colors]
        self.playerNames = playerNames
        self.winners = winners
        self.teamNames = teamNames
        self.colors = colors
    }
    
}
