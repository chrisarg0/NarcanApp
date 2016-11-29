//
//  ViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
//import Alamofire
//import RevealingSplashView
import ServiceCore
import ServiceCases
import ServiceKnowledge
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var contentView: UIScrollView!
    @IBOutlet var buttons: [UIButton]!
    
    var defaultHomeVc: UIViewController!
    var articleTypeVc: UIViewController!
    var requestVC: UIViewController!
    var myJourneyVc: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 1


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "iconTransparent")!,iconInitialSize: CGSize(width: 75, height: 75), backgroundColor: UIColor(red:0.16, green:0.29, blue:0.50, alpha:1.00))
        
        //Adds the revealing splash view as a sub view
        // let window = UIApplication.shared.keyWindow
        //window?.addSubview(revealingSplashView)
        
        //Starts animation
        //revealingSplashView.startAnimation(){
            //print("Completed")
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        contentView.contentSize = CGSize(width: contentView.frame.size.width, height: contentView.frame.size.height)

        
        let main = UIStoryboard(name: "Main", bundle: nil)

        defaultHomeVc = main.instantiateViewController(withIdentifier: "defaultHomeVc")
        
        articleTypeVc = main.instantiateViewController(withIdentifier: "articleTypeVc")
        requestVC = main.instantiateViewController(withIdentifier: "requestVC")
        myJourneyVc = main.instantiateViewController(withIdentifier: "myJourneyVc")

        viewControllers = [articleTypeVc, defaultHomeVc, myJourneyVc, requestVC]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
            if AppDelegate.defaultManager.user.display_name != nil && AppDelegate.defaultManager.user.display_name != "" {
                self.nameLbl.text = AppDelegate.defaultManager.user.display_name
            }
            
            //if AppDelegate.defaultManager.user.thumbnail != nil && AppDelegate.defaultManager.user.thumbnail != "" {
                //let imageUrlWithToken = "\(AppDelegate.defaultManager.user.thumbnail!)?oauth_token=\(AppDelegate.defaultManager.access_token!)"
                //self.avatarImageView.sd_setImage(with: URL(string: imageUrlWithToken)!, placeholderImage: UIImage(named: "avatar.png")!)
            //}
        //}
        
        
        
    }
    
    @IBAction func showKnowledge(_ sender: UIButton) {
        SCServiceCloud.sharedInstance().knowledge.setInterfaceVisible(true,
                                                                      animated: true,
                                                                      completion: nil)
        
    }
    
    @IBAction func sosDidTouch(_ sender: AnyObject) {
            let alertController = UIAlertController(title: nil, message: "If you're experiencing an emergency:", preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            
            alertController.addAction(cancelAction)
            
            let beginSOS = UIAlertAction(title: "Begin SOS Session", style: .default) { (action) in
                // handle response here.
                let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            }
        
            alertController.addAction(beginSOS)
            
            let careTeamMember4 = UIAlertAction(title: "Call Suicide Hotline", style: .destructive) { (action) in
                // handle response here.
                let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
                //UIApplication.shared.openURL(phoneNum1 as URL)
                
            }
            
            alertController.addAction(careTeamMember4)
            
            let careTeamMember5 = UIAlertAction(title: "Call 911", style: .destructive) { (action) in
                // handle response here.
                let phoneNum1:NSURL = NSURL(string: "tel://18009220204")!
                //UIApplication.shared.openURL(phoneNum1 as URL)
                
            }
            
            alertController.addAction(careTeamMember5)
            
            present(alertController, animated: true) {
            }
    }
    
    
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
                //UIApplication.shared.openURL(phoneNum1 as URL)
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
                //UIApplication.shared.openURL(phoneNum1 as URL)
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
        
        present(alertController, animated: true) {
        }
        
    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        
        let previousIndex = selectedIndex

        selectedIndex = sender.tag

        buttons[previousIndex].isSelected = false

        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)

        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
    
        func viewDidAppear(_ animated: Bool) {
            vc.didMove(toParentViewController: self)
        }
    }
    
    @IBAction func newCase(_ sender: AnyObject) {
        SCServiceCloud.sharedInstance().cases.setInterfaceVisible(true,
                                                                  animated: true,
                                                                  completion: nil)
    }
    
    
}

