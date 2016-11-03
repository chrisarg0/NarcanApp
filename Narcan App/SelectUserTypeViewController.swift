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

    @IBAction func didPressBack(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
        
    }
    @IBAction func carrierDidTouch(_ sender: AnyObject) {
        
    }
    
    @IBAction func requesterDidTouch(_ sender: AnyObject) {
    }

}
