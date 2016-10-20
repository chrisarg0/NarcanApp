//
//  ForgotPasswordViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
            submitBtn.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(_ sender: AnyObject) {
    
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func emailFieldDidChange(_ sender: AnyObject) {
        
        if emailField.text!.isEmpty {
            submitBtn.isHidden = true
        } else {
            submitBtn.isHidden = false
        }
        
    }
    

}
