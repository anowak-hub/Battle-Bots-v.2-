//
//  ViewController.swift
//  Battle Bots (v.2)
// 
//  Created by Andrew Nowak on 1/25/22.
// hog rider

import Firebase
import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate, UITabBarDelegate {
// MARK: - Outlets, Constants, and Variables
    var tournament = Tournament()
    var competition = [Tournament()]
    
    let database = Database.database().reference().child("Tournament")
    
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add any addiotional setup
        moveData()
    }
// MARK: - Functions and Actions

    public func moveData() {
        database.setValue(tournament.teamNames)
    }
    
    public func getData() {
        tournament.teamNames = []
        tournament.colors = []
        database.observeSingleEvent(of: .value) { snapshot in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let color = data.value
                let name = data.key
                self.tournament.teamNames.append(name)
                self.tournament.colors.append("\(String(describing: color))")
                self.competition.append(self.tournament)
            }
        }
        
    }
    
}

