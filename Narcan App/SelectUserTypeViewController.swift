//
//  SelectUserTypeViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class SelectUserTypeViewController: UIViewController {

    @IBOutlet weak var carrierIsSelected: UIImageView!
    @IBOutlet weak var requesterIsSelected: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carrierIsSelected.isHidden = true
        requesterIsSelected.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func carrierDidTouch(_ sender: AnyObject) {
        
        carrierIsSelected.isHidden = false
    }
    
    @IBAction func requesterDidTouch(_ sender: AnyObject) {
        requesterIsSelected.isHidden = false
    }

}
