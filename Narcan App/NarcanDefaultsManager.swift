//
//  NarcanDefaultsManager.swift
//  Narcan App
//
//  Created by Alex on 25/10/2016.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class NarcanDefaultsManager: NSObject {
    
    var mUserDefault : UserDefaults!
    
    override init() {
        self.mUserDefault = UserDefaults.standard
    }
    
    class var sharedInstance: NarcanDefaultsManager {
        struct Static {
            static var instance = NarcanDefaultsManager()
        }
        
        return Static.instance
    }
}
