//
//  Media.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import UIKit

class Media: UIViewController {
// MARK: - Outlets, Variables, and Constants
    @IBOutlet weak var team1label: UILabel!
    @IBOutlet weak var team2label: UILabel!
    @IBOutlet weak var winnerLabelOne: UILabel!
    @IBOutlet weak var winnerLabelTwo: UILabel!
    @IBOutlet weak var competitorLabelOne: UILabel!
    @IBOutlet weak var competitorLabelTwo: UILabel!
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }
// MARK: - Functions and Actions
    @IBAction func mediaHelpButtonPressed(_ sender: Any) {
        let helpAlert = UIAlertController(title: "Info", message: "The Media role is very simple. All the role does is allow the user to see who is currently competing and who wins the matches. They cannot affect the course of the game.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        helpAlert.addAction(ok)
        present(helpAlert, animated: true, completion: nil)
    }
    
    
}
