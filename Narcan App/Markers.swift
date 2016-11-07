//
//  Markers.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/7/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Markers: NSObject {
    
    let name: String
    let type: String
    let location: CLLocation
    let image: UIImage?
    
    init(name: String, type: String, imageName: String, latitude: Double, longitude: Double) {
        self.name = name
        self.type = type
        self.image = UIImage(named: imageName)
        self.location = CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension Markers: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        get {
            return location.coordinate
        }
    }
    var title: String? {
        get {
            return name
        }
    }
    var subtitle: String? {
        get {
            return type
        }
    }
}
