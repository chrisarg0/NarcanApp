//
//  CarrierEnRouteViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/7/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class CarrierEnRouteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCall(_ sender: UIButton) {
        
        let phoneNum1:NSURL = NSURL(string: "tel://17329077224")!
        UIApplication.shared.openURL(phoneNum1 as URL)
        
    }

    

}
