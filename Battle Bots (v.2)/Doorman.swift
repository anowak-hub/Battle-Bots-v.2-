//
//  Doorman.swift
//  Battle Bots (v.2)
//
//  Created by Adam Cubas on 2/4/22.
//

import UIKit

class Doorman: UIViewController, UITableViewDelegate, UITableViewDataSource {
// MARK: - Create any necessary variables
    var competitors: [String: String] = [:]
    //Variables below represent the two selected teams that will compete (store competing team names here)
    var compTeam1: String = ""
    var compTeam2: String = ""
    
//MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
// MARK: - Write any necessary functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
