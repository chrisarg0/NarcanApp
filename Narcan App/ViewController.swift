//
//  ViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
//import Alamofire
import RevealingSplashView
import ServiceCore
import ServiceCases
import ServiceKnowledge
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "iconTransparent")!,iconInitialSize: CGSize(width: 75, height: 75), backgroundColor: UIColor(red:0.16, green:0.29, blue:0.50, alpha:1.00))
        
        //Adds the revealing splash view as a sub view
        let window = UIApplication.shared.keyWindow
        window?.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
            
            if AppDelegate.defaultManager.user.display_name != nil && AppDelegate.defaultManager.user.display_name != "" {
                self.nameLbl.text = AppDelegate.defaultManager.user.display_name
            }
            
            //if AppDelegate.defaultManager.user.thumbnail != nil && AppDelegate.defaultManager.user.thumbnail != "" {
                //let imageUrlWithToken = "\(AppDelegate.defaultManager.user.thumbnail!)?oauth_token=\(AppDelegate.defaultManager.access_token!)"
                //self.avatarImageView.sd_setImage(with: URL(string: imageUrlWithToken)!, placeholderImage: UIImage(named: "avatar.png")!)
            //}
        }
        
    }

    @IBAction func showKnowledge(_ sender: UIButton) {
        SCServiceCloud.sharedInstance().knowledge.setInterfaceVisible(true,
                                                                      animated: true,
                                                                      completion: nil)
        
    }
    


}

