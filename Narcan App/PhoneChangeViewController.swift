//
//  PhoneChangeViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/26/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class PhoneChangeViewController: UIViewController {

    @IBOutlet weak var phoneNumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCancel(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)

        
    }
    
    
}