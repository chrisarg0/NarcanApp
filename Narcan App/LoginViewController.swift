//
//  LoginViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
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
            delay(3, closure: {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
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
