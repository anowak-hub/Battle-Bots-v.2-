//
//  Judge.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import Firebase
import UIKit

class Judge: UIViewController {

    @IBOutlet weak var team1Label: UIStackView!
    @IBOutlet weak var team2Label: UIStackView!
    @IBOutlet weak var team1Button: UIButton!
    @IBOutlet weak var team2Button: UIButton!
// MARK: - Outlets, Constants, and Variables
    
    let databaseCurrentTeams = Database.database().reference().child("CurrentTeams")
    var currentTeams: [String] = [""]
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentTeams()
    }
// MARK: - Actions, Functions, etc.

    @IBAction func team1ButtonPressed(_ sender: Any) {
    }
    
    @IBAction func team2ButtonPressed(_ sender: Any) {
    }
    
    @IBAction func helpButtonPressed(_ sender: Any) {
        let helpAlert = UIAlertController(title: "Info", message: "The Judge's job is to determine the victor of the match. In order to do that, the judge must press one of the buttons, which represents the teams, under 'Select a Winner.' After selecting a team, you will be asked to confirm your decision. Once the confirmation is complete, you have successfully chosen a winner.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        helpAlert.addAction(ok)
        present(helpAlert, animated: true, completion: nil)
    }
    
    func setCurrentTeams() {
        databaseCurrentTeams.observeSingleEvent(of: .value) {snapshot in
            
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                if let value = data.value {
                    self.currentTeams.append(String(describing: value))
                print(self.currentTeams)
        
                }
            }
        }
    }
    
}
  
