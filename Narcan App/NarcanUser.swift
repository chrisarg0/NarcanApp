//
//  NarcanUser.swift
//  Narcan App
//
//  Created by Alex on 25/10/2016.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class NarcanUser: NSObject {
    
    var id : String!
    var user_id : String!
    var organization_id : String!
    var username : String!
    var nick_name : String!
    var display_name : String!
    var email : String!
    var picture : String!
    var thumbnail : String!
    var addr_street : String!
    var addr_city : String!
    var addr_state : String!
    var addr_country : String!
    var addr_zip : String!
    var mobile_phone : String!
    var user_type : String!
    
    init(dic : NSDictionary) {
        
        if (dic.object(forKey: "id") != nil && !(dic.object(forKey: "id")! as AnyObject).isEqual(NSNull()) ) {
            id = dic.object(forKey: "id") as! String
        }
        
        if (dic.object(forKey: "user_id") != nil && !(dic.object(forKey: "user_id")! as AnyObject).isEqual(NSNull()) ) {
            user_id = dic.object(forKey: "user_id") as! String
        }
        
        if (dic.object(forKey: "organization_id") != nil && !(dic.object(forKey: "organization_id")! as AnyObject).isEqual(NSNull()) ) {
            organization_id = dic.object(forKey: "organization_id") as! String
        }
        
        if (dic.object(forKey: "username") != nil && !(dic.object(forKey: "username")! as AnyObject).isEqual(NSNull()) ) {
            username = dic.object(forKey: "username") as! String
        }
        
        if (dic.object(forKey: "nick_name") != nil && !(dic.object(forKey: "nick_name")! as AnyObject).isEqual(NSNull()) ) {
            nick_name = dic.object(forKey: "nick_name") as! String
        }
        
        if (dic.object(forKey: "display_name") != nil && !(dic.object(forKey: "display_name")! as AnyObject).isEqual(NSNull()) ) {
            display_name = dic.object(forKey: "display_name") as! String
        }
        
        if (dic.object(forKey: "email") != nil && !(dic.object(forKey: "email")! as AnyObject).isEqual(NSNull()) ) {
            email = dic.object(forKey: "email") as! String
        }
        
        if (dic.object(forKey: "photos") != nil && !(dic.object(forKey: "photos")! as AnyObject).isEqual(NSNull()) ) {
            let photos = dic.object(forKey: "photos") as! NSDictionary
            picture = photos.object(forKey: "picture") as! String
            thumbnail = photos.object(forKey: "thumbnail") as! String
        }
        
        if (dic.object(forKey: "addr_street") != nil && !(dic.object(forKey: "addr_street")! as AnyObject).isEqual(NSNull()) ) {
            addr_street = dic.object(forKey: "addr_street") as! String
        }
        
        if (dic.object(forKey: "addr_city") != nil && !(dic.object(forKey: "addr_city")! as AnyObject).isEqual(NSNull()) ) {
            addr_city = dic.object(forKey: "addr_city") as! String
        }
        
        if (dic.object(forKey: "addr_state") != nil && !(dic.object(forKey: "addr_state")! as AnyObject).isEqual(NSNull()) ) {
            addr_state = dic.object(forKey: "addr_state") as! String
        }
        
        if (dic.object(forKey: "addr_country") != nil && !(dic.object(forKey: "addr_country")! as AnyObject).isEqual(NSNull()) ) {
            addr_country = dic.object(forKey: "addr_country") as! String
        }
        
        if (dic.object(forKey: "addr_zip") != nil && !(dic.object(forKey: "addr_zip")! as AnyObject).isEqual(NSNull()) ) {
            addr_zip = dic.object(forKey: "addr_zip") as! String
        }
        
        if (dic.object(forKey: "mobile_phone") != nil && !(dic.object(forKey: "mobile_phone")! as AnyObject).isEqual(NSNull()) ) {
            mobile_phone = dic.object(forKey: "mobile_phone") as! String
        }
        
        if (dic.object(forKey: "user_type") != nil && !(dic.object(forKey: "user_type")! as AnyObject).isEqual(NSNull()) ) {
            user_type = dic.object(forKey: "user_type") as! String
        }
    }
    

}
