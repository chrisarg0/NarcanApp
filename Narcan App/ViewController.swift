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
        
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "NarcanFinderAppIcon@1x")!,iconInitialSize: CGSize(width: 181, height: 181), backgroundColor: UIColor(red:0.90, green:0.06, blue:0.47, alpha:1.00))
        
        //Adds the revealing splash view as a sub view
        let window = UIApplication.shared.keyWindow
        window?.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
            
            if AppDelegate.defaultManager.user.display_name != "" {
                self.nameLbl.text = AppDelegate.defaultManager.user.display_name
            }
            
            if AppDelegate.defaultManager.user.thumbnail != "" {
                self.avatarImageView.sd_setImage(with: URL(string: AppDelegate.defaultManager.user.picture)!, placeholderImage: UIImage(named: "avatar.png")!)
                
                
            }
        }
        
    }

    @IBAction func showKnowledge(_ sender: UIButton) {
        SCServiceCloud.sharedInstance().knowledge.setInterfaceVisible(true,
                                                                      animated: true,
                                                                      completion: nil)
        
    }
    


}

