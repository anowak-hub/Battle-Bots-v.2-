//
//  Doorman.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import UIKit

class Doorman: UIViewController, UITableViewDelegate, UITableViewDataSource {
// MARK: - Create any necessary variables
    var competitors: [Tournament] = []
    @IBOutlet weak var doorTableView: UITableView!
    var teams : [String: String] = [:]
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        doorTableView.dataSource = self
        doorTableView.delegate = self
    }
// MARK: - Write any necessary functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
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
        if editingStyle == .delete {
            teams.remove(at: indexPath.row)
            getData()
        }
        doorTableView.reloadData()
    }
    
    func getData() {
        
    }
}
