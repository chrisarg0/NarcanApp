//
//  NotificationRequestViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import CoreLocation

class NotificationRequestViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

    //Alex Location Manager
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}
