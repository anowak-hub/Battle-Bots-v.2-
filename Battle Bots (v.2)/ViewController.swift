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
    
    let database = Database.database().reference().child("Tournament")
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add any addiotional setup
        moveData()
    }
// MARK: - Functions and Actions

    func moveData() {
        database.setValue(tournament.teamNames)
    }
    
    func getData() {
        
        
    }
    
}

