//
//  Carriers.swift
//  Narcan App
//
//  Created by Chris Argonish on 12/7/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import MapKit

class Carriers: NSObject {

    let firstName: String
    let lastName: String
    let phone: String
    let location: CLLocation
    let image: UIImage?
    
    init(firstName: String, lastName: String, phone: String, imageName: String, latitude: Double, longitude: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        self.image = UIImage(named: imageName)
    }
}

extension Carriers: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        get {
            return location.coordinate
        }
    }
    var title: String? {
        get {
            return firstName
        }
    }
    var subtitle: String? {
        get {
            return phone
        }
    }
}
