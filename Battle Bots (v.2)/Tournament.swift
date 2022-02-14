//
//  Tournament.swift
//  Battle Bots (v.2)
//
//  Created by Ashley Saju on 1/27/22.
//

import Foundation
import Firebase


class Tournament {
    
    var color: String = ""
    var teamName: String = ""
    var team: [String : String] = [:]
    var playerName: String = ""
    var winner: String = ""

    
    init() {
        
        
    }
    
    init(color: String, teamName: String, teams: [[String]: [String]], playerName: String, winner: String){
        self.team = [teamName: color]
        self.playerName = playerName
        self.winner = winner
        self.teamName = teamName
        self.color = color
    }
    
}
