//
//  Judge.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import Firebase
import UIKit

class Judge: UIViewController {
// MARK: - Outlets, Constants, and Variables
    let database = Database.database().reference().child("currentTeams")
    var currentTeams: [String] = [""]
    database.setValue(currentTeams)
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }
// MARK: - Actions, Functions, etc.

}
