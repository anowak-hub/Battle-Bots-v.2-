//
//  ViewController.swift
//  Battle Bots (v.2)
// 
//  Created by Andrew Nowak on 1/25/22.
// hog rider

import Firebase
import UIKit

class ViewController: UIViewController {
// MARK: - Outlets, Constants, and Variables
    var tournamentTeams =
    let database = Database.database().reference().child("Tournament")
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
// MARK: - Functions and Actions
    func confirm() {
        let alert = UIAlertController(title: "Confirm", message: "Do You Wish to Proceed?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: nil)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    func moveData() {
        
    }
    
}

