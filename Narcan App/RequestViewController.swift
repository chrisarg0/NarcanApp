//
//  RequestViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import MapKit
import ServiceCore
import SalesforceKit

class RequestViewController: UIViewController, SCServiceCloudDelegate {
    
    @IBOutlet weak var carrierView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var userTypeLbl: UILabel!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //SCServiceCloud.sharedInstance().delegate = self
        
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(location: initialLocation)
        
        if AppDelegate.defaultManager.user.thumbnail != nil && AppDelegate.defaultManager.user.thumbnail != "" {
            let imageUrlWithToken = "\(AppDelegate.defaultManager.user.thumbnail!)?oauth_token=\(AppDelegate.defaultManager.access_token!)"
            self.avatarImageView.sd_setImage(with: URL(string: imageUrlWithToken)!, placeholderImage: UIImage(named: "avatar.png")!)
            
        }
        
        if AppDelegate.defaultManager.user.user_type != nil && AppDelegate.defaultManager.user.user_type != "" {
            self.userTypeLbl.text = AppDelegate.defaultManager.user.user_type
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(_ sender: AnyObject) {
    
        navigationController!.popViewController(animated: true)
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
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
    

}
