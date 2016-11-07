//
//  RequestViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/6/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import MapKit
import ServiceCore
import SalesforceKit

class RequestViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var carrierView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var userTypeLbl: UILabel!
    
    //let regionRadius: CLLocationDistance = 1000
    
    var startLocation: CLLocation?
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //SCServiceCloud.sharedInstance().delegate = self
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        
        let laTaqueria = CLLocation(latitude: 37.774929, longitude: -122.419416)
        let regionRadius: CLLocationDistance = 1000.0
        let region = MKCoordinateRegionMakeWithDistance(laTaqueria.coordinate, regionRadius, regionRadius)
        mapView.setRegion(region, animated: true)
        // mapView.delegate = self
        
        
        //let initialLocation = CLLocation(latitude: 37.774929, longitude: -122.419416)
        //centerMapOnLocation(location: initialLocation)
        
        //var annotation = MKPointAnnotation()
        
        
        
        
        // Sets Avatar Image
        //if AppDelegate.defaultManager.user.thumbnail != nil && AppDelegate.defaultManager.user.thumbnail != "" {
        //let imageUrlWithToken = "\(AppDelegate.defaultManager.user.thumbnail!)?oauth_token=\(AppDelegate.defaultManager.access_token!)"
        //self.avatarImageView.sd_setImage(with: URL(string: imageUrlWithToken)!, placeholderImage: UIImage(named: "avatar.png")!)
        
        //}
        
        //Sets Carriers Name
        //if AppDelegate.defaultManager.user.user_type != nil && AppDelegate.defaultManager.user.user_type != "" {
        //self.userTypeLbl.text = AppDelegate.defaultManager.user.user_type
        //}
        // Calculate distance
    }
    
    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else {
            guard let latest = locations.first else { return }
            let distanceInMeters = startLocation?.distance(from: latest)
            print("distance in meters: \(distanceInMeters!)")
        }
        
    }
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager?.startUpdatingLocation()
            locationManager?.allowsBackgroundLocationUpdates = true
        }
    }
    
    

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
    
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        if startLocation == nil {
            startLocation  = locations.first
        } else {
            guard locations.first != nil else {return}
            let distanceInMeters = startLocation?.distance(from: startLocation!)
            print("distance in meters:\(distanceInMeters)")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(_ sender: AnyObject) {
        
        navigationController!.popViewController(animated: true)
        
    }
    
    //func centerMapOnLocation(location: CLLocation) {
      //  let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        //mapView.setRegion(coordinateRegion, animated: true)
    //}
    
    // Service cloud helper methods
    
    func serviceCloud(_ serviceCloud: SCServiceCloud,
                      shouldAuthenticateService service: String,
                      completion: @escaping (SFUserAccount?) -> Void) -> Bool {
        
        let user = SFUserAccount.init()// get user account
        user.email = "chris@test.com"
        
        // After acquiring user information, call
        // this completion block to set the new user:
        completion(user)
        
        return true
    }
    
    func serviceCloud(serviceCloud: SCServiceCloud,
                      serviceAuthenticationFailedWithError error: NSError,
                      forService service: String) {
        
        // Inspect error and handle appropriately.
    }
    
    // PHONE BOOK (CARE TEAM MEMBERS)
    // & alert controller
    
    @IBAction func phoneBookDidTouch(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Call someone from your care team:", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        
        alertController.addAction(cancelAction)
        
        let careTeamMember1 = UIAlertAction(title: "Wendy Pinkman", style: .default) { (action) in
            // handle response here.
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
            
            
            let call = UIAlertAction(title: "Call", style: .default) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
                UIApplication.shared.openURL(phoneNum1 as URL)
            }
            
            alertController.addAction(call)
            
            let sms = UIAlertAction(title: "Send text message", style: .default) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
                
            }
            
            alertController.addAction(sms)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true) {
            }
            
        }
        
        alertController.addAction(careTeamMember1)
        
        let careTeamMember2 = UIAlertAction(title: "Tim Pinkman", style: .default) { (action) in
            // handle response here.
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let call = UIAlertAction(title: "Call", style: .default) { (action) in
                // do somesthing
                let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
                UIApplication.shared.openURL(phoneNum1 as URL)
            }
            
            alertController.addAction(call)
            
            let sms = UIAlertAction(title: "Send text message", style: .default) { (action) in
                // do somesthing
                
            }
            
            alertController.addAction(sms)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true) {
            }
        }
        
        alertController.addAction(careTeamMember2)
        
        let careTeamMember3 = UIAlertAction(title: "Walter White", style: .default) { (action) in
            // handle response here.
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let call = UIAlertAction(title: "Call", style: .default) { (action) in
                // do somesthing
                let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
                UIApplication.shared.openURL(phoneNum1 as URL)
            }
            
            alertController.addAction(call)
            
            let sms = UIAlertAction(title: "Send text message", style: .default) { (action) in
                // do somesthing
            }
            
            alertController.addAction(sms)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true) {
            }
        }
        
        alertController.addAction(careTeamMember3)
        
        let careTeamMember4 = UIAlertAction(title: "Call Suicide Hotline", style: .destructive) { (action) in
            // handle response here.
            let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
            UIApplication.shared.openURL(phoneNum1 as URL)
            
        }
        
        alertController.addAction(careTeamMember4)
        
        let careTeamMember5 = UIAlertAction(title: "Call 911", style: .destructive) { (action) in
            // handle response here.
            let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
            UIApplication.shared.openURL(phoneNum1 as URL)
            
        }
        
        alertController.addAction(careTeamMember5)
        
        present(alertController, animated: true) {
        }
    }
    
    // MAP Overlay
    
    @IBAction func didPressCall(_ sender: UIButton) {
    }
    
    @IBAction func didPressMessage(_ sender: UIButton) {
    }
    
    @IBAction func didPressCancel(_ sender: UIButton) {
    }
    
    @IBAction func didPressCenter(_ sender: UIButton) {
    }
}

