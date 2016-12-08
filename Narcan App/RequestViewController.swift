//
//  RequestViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/6/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import ServiceCore
import SalesforceKit

class RequestViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var carrierView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var userTypeLbl: UILabel!
    @IBOutlet weak var carrier: UIImageView!
    @IBOutlet weak var me: UIImageView!
    @IBOutlet weak var loadingScreen: UIImageView!
    @IBOutlet weak var spinnerImageView: UIImageView!
    @IBOutlet weak var loadingMsg1: UILabel!
    @IBOutlet weak var loadingMsg2: UILabel!
    
    //Custom Spinner
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var loading_4: UIImage!
    var loading_5: UIImage!
    var loading_6: UIImage!
    var loading_7: UIImage!
    var spinnerImages: [UIImage]!
    var animatedSpinner: UIImage!
    
    
    // map stuff
    let manager = CLLocationManager()
    //let regionRadius: CLLocationDistance = 1000
    //var startLocation: CLLocation?
    //var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // custom loading animation
        loading_1 = UIImage(named: "spinner-1")
        loading_2 = UIImage(named: "spinner-2")
        loading_3 = UIImage(named: "spinner-3")
        loading_4 = UIImage(named: "spinner-4")
        loading_5 = UIImage(named: "spinner-5")
        loading_6 = UIImage(named: "spinner-6")
        loading_7 = UIImage(named: "spinner-7")
        spinnerImages = [loading_1, loading_2, loading_1, loading_3, loading_1, loading_4, loading_1, loading_5, loading_1, loading_6, loading_1, loading_7]
        
        animatedSpinner = UIImage.animatedImage(with: spinnerImages, duration: 3.0)

        spinnerImageView.image = animatedSpinner
        
        // show map view animation
        carrier.frame.origin.y = -20
        me.frame.origin.y = -20
        // Do any additional setup after loading the view.
        //SCServiceCloud.sharedInstance().delegate = self
        carrierView.alpha = 0
        loadingScreen.alpha = 1
        
        UIView.animate(withDuration: 6.0, animations: {
            self.spinnerImageView.alpha = 0
            self.loadingMsg1.alpha = 0
            self.loadingMsg2.alpha = 0
            self.loadingScreen.alpha = 0
            self.carrierView.alpha = 1
        })
        
        
        // mapView stuff 1
        
        let zyngaOffice = CLLocation(latitude: 37.770927, longitude: -122.403665)
        
        let regionRadius: CLLocationDistance = 200000.0
        let region = MKCoordinateRegionMakeWithDistance(zyngaOffice.coordinate, regionRadius, regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()

        //2
        let sourceLocation = CLLocationCoordinate2D(latitude: 37.770927, longitude: -122.403665)
        let destinationLocation = CLLocationCoordinate2D(latitude: 37.784399, longitude: -122.403422)
        
        //3
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)

        //4
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        //5
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Me"
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "Deborah"

        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        //6
        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

        //7
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        //8
        let directions = MKDirections(request: directionRequest)

        //9
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        

        
//        locationManager = CLLocationManager()
//        locationManager?.delegate = self
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.requestWhenInUseAuthorization()
        
        
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
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.me.frame.origin.y = 362
            }, completion: nil)
        
        UIView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.carrier.frame.origin.y = 78
            }, completion: nil)
    }
    
//    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if startLocation == nil {
//            startLocation = locations.first
//        } else {
//            guard let latest = locations.first else { return }
//            let distanceInMeters = startLocation?.distance(from: latest)
//            print("distance in meters: \(distanceInMeters!)")
//        }
//        
//    }
    
//    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//            locationManager?.startUpdatingLocation()
//            locationManager?.allowsBackgroundLocationUpdates = true
//        }
//    }
//    
//    
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    }
    
    
//    func locationManager(_ manager: CLLocationManager,
//                         didUpdateLocations locations: [CLLocation]) {
//        
//        if startLocation == nil {
//            startLocation  = locations.first
//        } else {
//            guard let latest = locations.first else {return}
//            let distanceInMeters = startLocation?.distance(from: startLocation!)
//            print("distance in meters:\(distanceInMeters)")
//        }
//    }
    
    
    // Actions
    
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

extension RequestViewController: CLLocationManagerDelegate {
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
}

extension RequestViewController: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering")
    }
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//        
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "carrierLocation") as? MKPinAnnotationView
//        
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "carrierLocation")
//        } else {
//            annotationView?.annotation = annotation
//        }
//        
//        annotationView?.pinTintColor = UIColor.green
//        annotationView?.canShowCallout = true
//        if let place = annotation as? Carriers,
//            let image = place.image {
//                annotationView?.detailCalloutAccessoryView = UIImageView(image: image)
//        }
//        
//        return annotationView
//        
//    }
}
