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
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var team1Button: UIButton!
    @IBOutlet weak var team2Button: UIButton!
    
    let databaseCurrentTeams = Database.database().reference().child("Current")
    let databaseWinners = Database.database().reference().child("Winners")
    var currentTeams: [String] = []
    var winnersArray = [String()]
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentTeams()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setCurrentTeams()
    }
// MARK: - Actions, Functions, etc.

    @IBAction func team1ButtonPressed(_ sender: Any) {
        let confirmAlert = UIAlertController(title: "Confirm", message: "Notice: Once you press 'Confirm' you will have successfully selected the winner. You cannot go back on this decision.", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { confirm in
            self.winnersArray.append(self.team1Label.text!)
            self.databaseWinners.setValue(self.winnersArray)
            
            self.team1Button.alpha = 0
            self.team2Button.alpha = 0
        }
        
        confirmAlert.addAction(cancel)
        confirmAlert.addAction(confirm)
        present(confirmAlert, animated: true, completion: nil)
    }
    
    @IBAction func team2ButtonPressed(_ sender: Any) {
        let confirmAlert = UIAlertController(title: "Confirm", message: "Notice: Once you press 'Confirm' you will have successfully selected the winner. You cannot go back on this decision.", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { confirm in
            self.winnersArray.append(self.team2Label.text!)
            self.databaseWinners.setValue(self.winnersArray)
            
            self.team1Button.alpha = 0
            self.team2Button.alpha = 0
        }
        
        confirmAlert.addAction(cancel)
        confirmAlert.addAction(confirm)
        present(confirmAlert, animated: true, completion: nil)
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
                }
            }
            let lastIndex = self.currentTeams.count-1
            if self.currentTeams != [] {
                self.team1Label.text = self.currentTeams[lastIndex-1]
                self.team2Label.text = self.currentTeams[lastIndex]
            }
        }
    }
}
