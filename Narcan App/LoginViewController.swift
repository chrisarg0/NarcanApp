//
//  LoginViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import AFNetworking

class LoginViewController: UIViewController {
    
    static let Salesforce =
        [
            "consumerKey": "3MVG9fMtCkV6eLheNionz1q.nG4THaffbBSGBaniRqNdWm5qA9vZZC01ct10P1xBs.QbrS9Y42o784K0x1LCE",
            "consumerSecret": "1234991665278513929"
    ]
    
    static let apiManager = NarcanAPIManager.sharedInstance
    
    @IBOutlet weak var loginForm: UIImageView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var pwField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
        /* UIView.animate(withDuration: 0.4) {
            self.icon.center.y = self.icon.center.y - 130
        } */

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /* UIView.animate(withDuration: 90.0) {
            self.loginForm.alpha = 1
        } */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountDidTouch(_ sender: AnyObject) {
        
    }
    
    @IBAction func pwEditDidChange(_ sender: AnyObject) {
        
        if emailField.text!.isEmpty || pwField.text!.isEmpty {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
        
    }
    @IBAction func didPressLogin(_ sender: AnyObject) {
        
        if emailField.text != "" && pwField.text != "" {
            
            if LoginViewController.apiManager.isOnline() {
                
                let client_id = LoginViewController.Salesforce["consumerKey"]
                let client_secret = LoginViewController.Salesforce["consumerSecret"]
                let username = emailField.text
                let userpw = pwField.text
                
                let login_url = "https://login.salesforce.com/services/oauth2/token"
                let params = ["grant_type":"password", "client_id":client_id!, "client_secret":client_secret!, "username":username!, "password":userpw!]
                
                AppDelegate.apiManager.postMethodAPI(url: login_url, params: params as NSDictionary, successBlock: { (success) -> () in
                    
                    AppDelegate.defaultManager.is_login = true
                    
                    let access_token = success.object(forKey: "access_token")
                    if access_token != nil {
                        AppDelegate.defaultManager.access_token = access_token as! String
                    }
                    
                    let instance_url = success.object(forKey: "instance_url")
                    if access_token != nil {
                        AppDelegate.defaultManager.access_token = instance_url as! String
                    }
                    
                    let id = success.object(forKey: "id")
                    if id != nil {
                        AppDelegate.defaultManager.access_token = id as! String
                    }
                    
                    let signature = success.object(forKey: "signature")
                    if signature != nil {
                        AppDelegate.defaultManager.access_token = signature as! String
                    }
                    
                    
                    }, failureBlock: { (failure) -> () in
                        
                })
                
//                delay(3, closure: {
//                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
//                })
                
            }
            
            
        } else {
            delay(0.4, closure: {
                let alertControler = UIAlertController(title: "Sign-in Failed", message: "Please check that your email address and password are correct", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction) in
                    
                })
                
                alertControler.addAction(okAction)
                self.present(alertControler, animated: true, completion: nil)
                
            })
        }
        
    }
    
    
    
    
}
