//
//  LoginViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var pwField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func helpBtnDidTouch(_ sender: AnyObject) {
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
