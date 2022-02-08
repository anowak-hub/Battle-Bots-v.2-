//
//  Doorman.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import UIKit

class Doorman: UIViewController, UITableViewDelegate, UITableViewDataSource {
// MARK: - Create any necessary variables
    var competitors: [[String] : [String]] = [:]
    var compTeam1: String = ""
    var compTeam2: String = ""
    @IBOutlet weak var doorTableView: UITableView!
    //Variables below represent the two selected teams that will compete (store competing team names here)
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        doorTableView.dataSource = self
        doorTableView.delegate = self
    }
// MARK: - Write any necessary functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func confirm() {
        let alert = UIAlertController(title: "Confirm", message: "Do You Wish to Proceed?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: nil)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
        doorTableView.reloadData()
    }
}
