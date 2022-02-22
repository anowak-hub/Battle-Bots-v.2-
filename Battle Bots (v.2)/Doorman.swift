//
//  Doorman.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import Firebase
import UIKit

class Doorman: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var team1selected: UILabel!
    @IBOutlet weak var team2selected: UILabel!
    // MARK: - Create any necessary variables
    var competitors: [Tournament] = []
    var database = Database.database().reference().child("Tournament")
    @IBOutlet weak var doorTableView: UITableView!
    var teams : [String: String] = [:]
    var teamsArray : [NSDictionary] = []
    var selectedTeams : [String] = []
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        doorTableView.dataSource = self
        doorTableView.delegate = self
    }
// MARK: - Write any necessary functions
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        let confirmAlert = UIAlertController(title: "Confirm", message: "Would you like to confirm your selection? (Notice: Once you confirm, this page will be temporarily locked until the judge decides a winner)", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { confirm in
            let inProgressAlert = UIAlertController(title: "In Progress", message: "Sorry, but the match is currently in progress. You'd have to wait until the judge decides a winner.", preferredStyle: UIAlertController.Style.alert)
            self.present(inProgressAlert, animated: true, completion: nil)
        }
        confirmAlert.addAction(cancel)
        confirmAlert.addAction(confirm)
        present(confirmAlert, animated: true, completion: nil)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        selectedTeams = []
    }
    
    @IBAction func helpButtonPressed(_ sender: Any) {
        let helpAlert = UIAlertController(title: "Info", message: "The Doorman plays a very special role. It's job is to select the teams and students from the presented list and decide who exactly is competing against who. After selecting the desired competitors, the Doorman will be able to confirm their selection, and the app will update accordingly.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        helpAlert.addAction(ok)
        present(helpAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell", for: indexPath)
        cell.textLabel?.text = competitors[indexPath.row].teamName
        return cell
    }
    
    func confirm() {
        let alert = UIAlertController(title: "Confirm", message: "Do You Wish to Proceed?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: nil)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            let comp1 = competitors[indexPath.row].teamName
            let comp2 = competitors[indexPath.row].teamName
            team1selected.text = comp1
            team2selected.text = comp2
            
            getTeams()
        }
        doorTableView.reloadData()
    }
    
    func getTeams() {
        database.observeSingleEvent(of: .value) { snapshot in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                
            }
        }
    }
}
