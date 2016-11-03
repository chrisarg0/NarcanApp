//
//  LoginViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD
import SalesforceKit

class LoginViewController: UIViewController {
    
    static let Salesforce =
        [
            "consumerKey": "3MVG9fMtCkV6eLheNionz1q.nG4THaffbBSGBaniRqNdWm5qA9vZZC01ct10P1xBs.QbrS9Y42o784K0x1LCE",
            "consumerSecret": "1234991665278513929",
            "redirectURI":"naproxoneforce:///oauth/done",
            "loginDomain":"",
            "userID":""
    ]
    
    static let apiManager = NarcanAPIManager.sharedInstance
    
    
    @IBOutlet weak var loginParentView: UIView!
    @IBOutlet weak var formParentView: UIView!
    @IBOutlet weak var loginForm: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var formInitialY: CGFloat!
    var formOffset: CGFloat!
    var btnInitialY: CGFloat!
    var btnOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        emailField.becomeFirstResponder()
//        UIView.animate(withDuration: 0.4) {
//            self.icon.center.y = self.icon.center.y - 130
//        }

        // Do any additional setup after loading the view.
        
//        formInitialY = formParentView.frame.origin.y
//        formOffset = 0
//        btnInitialY = loginParentView.frame.origin.y
//        btnOffset = 0
        
        SFUserAccountManager.sharedInstance().oauthClientId = LoginViewController.Salesforce["consumerKey"]
        SFUserAccountManager.sharedInstance().oauthCompletionUrl = LoginViewController.Salesforce["redirectURI"]
        
        // assign values to our variables
        formInitialY = formParentView.frame.origin.y
        formOffset = -175
        btnInitialY = loginParentView.frame.origin.y
        btnOffset = -205
        
        // Register for keyboard events
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            self.formParentView.frame.origin.y = self.formInitialY + self.formOffset
            self.loginParentView.frame.origin.y = self.btnInitialY + self.btnOffset
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            self.formParentView.frame.origin.y = self.formInitialY
            self.loginParentView.frame.origin.y = self.btnInitialY
            
            func keyboardWillHide(notification: NSNotification) {
                // Move the buttons back down to it's original position
                self.loginParentView.frame.origin.y = self.btnInitialY
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         UIView.animate(withDuration: 90.0) {
            self.loginForm.alpha = 1
        }
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
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        
        if emailField.text != "" && pwField.text != "" {
            
            if LoginViewController.apiManager.isOnline() {
                
                MBProgressHUD.showAdded(to: self.view, animated: true)
                
                let client_id = LoginViewController.Salesforce["consumerKey"]
                let client_secret = LoginViewController.Salesforce["consumerSecret"]
                let username = emailField.text
                let userpw = pwField.text
                
                let login_url = "https://login.salesforce.com/services/oauth2/token"
                let params = ["grant_type":"password", "client_id":client_id!, "client_secret":client_secret!, "username":username!, "password":userpw!]
                
                AppDelegate.apiManager.postMethodAPI(url: login_url, params: params as NSDictionary, successBlock: { (success) -> () in
                    
                    AppDelegate.defaultManager.is_login = true
                    
                    let instance_url = success.object(forKey: "instance_url")
                    if instance_url != nil {
                        AppDelegate.defaultManager.instance_url = instance_url as! String
                    }
                    
                    let id = success.object(forKey: "id")
                    if id != nil {
                        AppDelegate.defaultManager.id = id as! String
                    }
                    
                    let token_type = success.object(forKey: "token_type")
                    if token_type != nil {
                        AppDelegate.defaultManager.token_type = token_type as! String
                    }
                    
                    let signature = success.object(forKey: "signature")
                    if signature != nil {
                        AppDelegate.defaultManager.signature = signature as! String
                    }
                    
                    let access_token = success.object(forKey: "access_token")
                    if access_token != nil {
                        AppDelegate.defaultManager.access_token = access_token as! String
                        self.getProfile()
                    }
                    
                    
                    
                    }, failureBlock: { (failure) -> () in
                        
                        MBProgressHUD.hide(for: self.view, animated: true)
                        
                        delay(0.4, closure: {
                            let alertControler = UIAlertController(title: "Sign-in Failed", message: "Please check that your email address and password are correct", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction) in
                                
                            })
                            
                            alertControler.addAction(okAction)
                            self.present(alertControler, animated: true, completion: nil)
                            
                        })
                        
                })
                
//                delay(3, closure: {
//                    self.performSegue(withIdentifier: "login_segue", sender: nil)
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
    
    func getProfile() {
        AppDelegate.apiManager.getMethodAPI(url: AppDelegate.defaultManager.id, params: [:], successBlock: { (success) -> () in
            MBProgressHUD.hide(for: self.view, animated: true)
        
            let user = NarcanUser(dic : success)
            
            AppDelegate.defaultManager.user = user
            
            delay(0.3, closure: {
                
                self.performSegue(withIdentifier: "login_segue", sender: nil)
            })
            
            }) { (error) -> () in
                
                MBProgressHUD.hide(for: self.view, animated: true)
                
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
