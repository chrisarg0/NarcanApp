//
//  SignUpViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/19/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pwFieldDidChange(_ sender: AnyObject) {
    
        if firstNameField.text!.isEmpty && lastNameField.text!.isEmpty && phoneField.text!.isEmpty && emailField.text!.isEmpty && pwField.text!.isEmpty {
            nextBtn.isSelected = false
        } else {
            nextBtn.isSelected = true
        }
    
    }
    
    

}
