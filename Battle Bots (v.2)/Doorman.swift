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
    @IBOutlet weak var doorTableView: UITableView!
    var teams : [String: String] = [:]
    var teamsArray : [NSDictionary] = []
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        doorTableView.dataSource = self
        doorTableView.delegate = self
    }
// MARK: - Write any necessary functions
    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
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
            
            getData()
        }
        doorTableView.reloadData()
    }
    
    func moveTeams() {
        teamsArray.append([teams.keys: teams.values])
        
        let database = Database.database().reference().child("Tournament")
        database.setValue(teamsArray)
    }
    
    func getData() {
        
    }
}
