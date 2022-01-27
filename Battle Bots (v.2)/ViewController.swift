//
//  ViewController.swift
//  Battle Bots (v.2)
//
//  Created by Andrew Nowak on 1/25/22.
// hog rider

import Firebase
import UIKit

class ViewController: UIViewController {

    let database = Database.database().reference().child("Tournament")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getData() {
        
    }
}

