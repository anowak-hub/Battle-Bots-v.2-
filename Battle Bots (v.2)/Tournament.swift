//
//  Tournament.swift
//  Battle Bots (v.2)
//
//  Created by Ashley Saju on 1/27/22.
//

import Foundation
import Firebase


class Tournament {
    
    var schoolName: String
    var robotName: String
    var studentMembers: [String]
    var color: String
    var team: [String : String]
    
    init(schoolName: String, robotName: String, studentMembers: [String],  color: String, team: [String: String]){
        self.schoolName = schoolName
        self.robotName = robotName
        self.studentMembers = studentMembers
        self.color = color
        self.team = [robotName: color]
    }
    
}
