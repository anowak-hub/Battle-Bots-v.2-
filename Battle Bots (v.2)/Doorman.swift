//
//  Doorman.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
// another hog rider

import Firebase
import UIKit


class Doorman: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var team1selected: UILabel!
    @IBOutlet weak var team2selected: UILabel!
    // MARK: - Create any necessary variables
    var teamsArray: [Tournament] = []
    let database = Database.database().reference().child("Tournament")
    let databaseCurrentTeams = Database.database().reference().child("Current")
    let databaseWinners = Database.database().reference().child("Winners")
    @IBOutlet weak var doorTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    var selectedTeams : [String] = []
    var ifWinnerSelected: Bool = Bool()
//MARK: - viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        doorTableView.reloadData()
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doorTableView.dataSource = self
        doorTableView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        getTeams()

       
    }
// MARK: - Write any necessary functions
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        let confirmAlert = UIAlertController(title: "Confirm", message: "Would you like to confirm your selection? (Notice: Once you confirm, this page will be temporarily locked until the judge decides a winner)", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { confirm in
            let inProgressAlert = UIAlertController(title: "In Progress", message: "Sorry, but the match is currently in progress. You'd have to wait until the judge decides a winner.", preferredStyle: UIAlertController.Style.alert)
            self.present(inProgressAlert, animated: true, completion: nil)
            
            self.databaseCurrentTeams.setValue([])
            self.databaseCurrentTeams.setValue(self.selectedTeams)
            
            self.databaseWinners.observeSingleEvent(of: .value) { snapshot in
                for data in snapshot.children.allObjects as! [DataSnapshot] {
                    if data.accessibilityRespondsToUserInteraction == true {
                        inProgressAlert.dismiss(animated: true, completion: nil)
                    }
                }
                
            }
                
            
        }
        confirmAlert.addAction(cancel)
        confirmAlert.addAction(confirm)
        present(confirmAlert, animated: true, completion: nil)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        selectedTeams = []
        team1selected.text = ""
        team2selected.text = ""
        
    }
    
    @IBAction func helpButtonPressed(_ sender: Any) {
        let helpAlert = UIAlertController(title: "Info", message: "The Doorman plays a very special role. It's job is to select the teams and students from the presented list and decide who exactly is competing against who. After selecting the desired competitors, the Doorman will be able to confirm their selection, and the app will update accordingly.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        helpAlert.addAction(ok)
        present(helpAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = teamsArray.count/2
        
        if tableView == self.doorTableView {
            return count
        } else if tableView == self.tableView {
            return teamsArray.count - count
        }
        return teamsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell", for: indexPath)
        
        if tableView == self.doorTableView {
            cell.textLabel?.text = teamsArray[indexPath.row].robotName
            
            
            
//            let R = CGFloat(Int(c.prefix(3))!)
//            let G = CGFloat(Int(c[c.index(c.startIndex, offsetBy: 3)..<c.index(c.endIndex, offsetBy: -3)])!)
//            let B = CGFloat(Int(c.suffix(3))!)
//
//            cell.backgroundConfiguration?.backgroundColor = .init(red: R/255, green: G/255, blue: B/255, alpha: 0.7)

        } else if tableView == self.tableView {
            cell.textLabel?.text = teamsArray[indexPath.row + teamsArray.count/2].robotName
//            let c = teamsArray[indexPath.row + teamsArray.count/2].school.values[]
//            let R = CGFloat(Int(c.prefix(3))!)
//            let G = CGFloat(Int(c[c.index(c.startIndex, offsetBy: 3)..<c.index(c.endIndex, offsetBy: -3)])!)
//            let B = CGFloat(Int(c.suffix(3))!)
//
//            cell.backgroundConfiguration?.backgroundColor = .init(red: R/255, green: G/255, blue: B/255, alpha: 0.7)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Add"
    }
    
    func confirm() {
        let alert = UIAlertController(title: "Confirm", message: "Do You Wish to Proceed?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: nil)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let comp1 = teamsArray[indexPath.row].robotName
            selectedTeams.insert(comp1, at: 0)
            team1selected.text = selectedTeams[0]
            
            
        }
        team1selected.text = selectedTeams[0]
        if selectedTeams.count > 1 {
            team2selected.text = selectedTeams[1]
        }
        doorTableView.reloadData()
    }
    
    func getTeams() {
        self.database.observeSingleEvent(of: .value) { snapshot in
            
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let robotTeam = Tournament()
                let name = data.key
                
                robotTeam.robotName = name
                self.teamsArray.append(robotTeam)
            }
        }
     
    }
    
    
}
extension UIColor {
     public convenience init(_ value: Int) {
         let red = CGFloat(value >> 16 & 0xFF) / 255.0
         let green = CGFloat(value >> 8 & 0xFF) / 255.0
         let blue = CGFloat(value & 0xFF) / 255.0
         self.init(red: red, green: green, blue: blue, alpha: 1.0)
     }
}
