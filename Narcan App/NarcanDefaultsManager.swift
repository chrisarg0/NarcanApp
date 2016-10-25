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
    
    var is_login:Bool! {
        
        get {
            return self.mUserDefault.bool(forKey: "is_login");
        }
        
        set {
            self.mUserDefault.set(newValue
                , forKey: "is_login");
            self.mUserDefault.synchronize();
        }
    }
    
    var access_token:String! {
        get {
            return mUserDefault.string(forKey: "access_token");
        }
        
        set {
            mUserDefault.setValue(newValue, forKey: "access_token");
            mUserDefault.synchronize();
        }
    }
    
    var instance_url:String! {
        get {
            return mUserDefault.string(forKey: "instance_url");
        }
        
        set {
            mUserDefault.setValue(newValue, forKey: "instance_url");
            mUserDefault.synchronize();
        }
    }
    
    var id:String! {
        get {
            return mUserDefault.string(forKey: "id");
        }
        
        set {
            mUserDefault.setValue(newValue, forKey: "id");
            mUserDefault.synchronize();
        }
    }
    
    var token_type:String! {
        get {
            return mUserDefault.string(forKey: "token_type");
        }
        
        set {
            mUserDefault.setValue(newValue, forKey: "token_type");
            mUserDefault.synchronize();
        }
    }

    
    var signature:String! {
        get {
            return mUserDefault.string(forKey: "signature");
        }
        
        set {
            mUserDefault.setValue(newValue, forKey: "signature");
            mUserDefault.synchronize();
        }
    }

}
