//
//  Tournament.swift
//  Battle Bots (v.2)
//
//  Created by Ashley Saju on 1/27/22.
//

import Foundation
import Firebase


class Tournament {
    
    var team: Robot = Robot(school: "", color: "", members: [""])
    var robotName: String = ""
    
    
    init()  {
        
    }
    
    init(name: String, team: Robot){
        self.robotName = name
        self.team = team
    }
    
}

class Robot{
    
    var school: String = ""
    var color: String = ""
    var members: [String] = [""]
    
    init(){
        
    }
    init(school: String, color: String, members: [String]){
        self.school = school
        self.color = color
        self.members = members
    }
    
}
