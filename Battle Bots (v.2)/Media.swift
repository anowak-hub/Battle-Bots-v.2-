//
//  Media.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import UIKit
import Firebase

class Media: UIViewController {
// MARK: - Outlets, Variables, and Constants
    @IBOutlet weak var team1label: UILabel!
    @IBOutlet weak var team2label: UILabel!
    @IBOutlet weak var winnerLabelOne: UILabel!
    @IBOutlet weak var winnerLabelTwo: UILabel!
    @IBOutlet weak var competitorLabelOne: UILabel!
    @IBOutlet weak var competitorLabelTwo: UILabel!
    
    let databaseWinners = Database.database().reference().child("Winners")
    let database = Database.database().reference().child("Tournament")
    let databaseCurrent = Database.database().reference().child("Current")
    
    var currentTeamsArray = [Tournament()]
    var currentNameArray = [String()]
    var winnerNameArray = [String()]
    // MARK: - View Properties
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        grabData()
        getWinner()
    }
// MARK: - Functions and Actions
    @IBAction func mediaHelpButtonPressed(_ sender: Any) {
        let helpAlert = UIAlertController(title: "Info", message: "The Media role is very simple. All the role does is allow the user to see who is currently competing and who wins the matches. They cannot affect the course of the game.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        helpAlert.addAction(ok)
        present(helpAlert, animated: true, completion: nil)
    }
    
    func grabData() {
        self.databaseCurrent.observeSingleEvent(of: .value) { [self] snapshot in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let name = data.value as! String
                self.currentNameArray.append(name)
                
            }
            if currentNameArray != [] || currentNameArray != [""] {
                self.team1label.text = currentNameArray[1]
                self.team2label.text = currentNameArray[2]
            }
//            var m1 = String()
//            for i in 0..<self.currentTeamsArray[0].team.members.count{
//                m1 += (self.currentTeamsArray[0].team.members[i] + "\n")
//            }
//            var m2 = String()
//            for i in 0..<self.currentTeamsArray[1].team.members.count{
//                m2 += (self.currentTeamsArray[1].team.members[i] + "\n")
//            }
//
//            self.competitorLabelOne.text = m1
//            self.competitorLabelTwo.text = m2
            
            
        }
        
        self.database.observeSingleEvent(of: .value) { snapshot in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let robotTeam = Tournament()
                let name = data.key
                
                for n in 0..<self.currentNameArray.count {
                    if self.currentNameArray[n] == name {
                        robotTeam.robotName = name
                        
                        self.database.child(name).observeSingleEvent(of: .value) { snap in
                            let s = snap.children.allObjects as! [DataSnapshot]
                            for d in 0..<s.count{
                                
                                let k = s[d].key
                                if k == "Color"{
                                    robotTeam.team.color = s[d].value as! String
                                }else if k == "School"{
                                    robotTeam.team.school = s[d].value as! String
                                }else if k == "Members"{
                                    if let m = s[d].value as? [String]{
                                        robotTeam.team.members = m
                                    }
                                }
                            
                                
                            }
                            
                            
                        }
                    }
                }
                
                
                self.currentTeamsArray.append(robotTeam)
            }
        }
    }
    
    func getWinner() {
        print("\(self.winnerNameArray)")
        self.databaseWinners.observeSingleEvent(of: .value) { snapshot in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let winnerName = data.value as! String
                
                self.winnerNameArray.append(winnerName)
                print("\(self.winnerNameArray)")
        }
    }
        for item in winnerNameArray {
            if item == team1label.text {
                winnerLabelOne.alpha = 1
            }
            else if item == team2label.text {
                winnerLabelTwo.alpha = 1
            }
            else {
                winnerLabelOne.alpha = 0
                winnerLabelTwo.alpha = 0
            }
        }
    }
}
