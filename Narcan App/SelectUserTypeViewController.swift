//
//  SelectUserTypeViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class SelectUserTypeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stdUserDidSelect(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func lovedOneUserDidSelect(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func carrierUserDidSelect(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func doctorUserDidSelect(_ sender: UIButton) {
        sender.isSelected = true
    }
    
}
