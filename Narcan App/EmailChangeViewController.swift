//
//  EmailChangeViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/26/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import SalesforceKit

class EmailChangeViewController: UIViewController {

    @IBOutlet weak var oldEmailLbl: UILabel!
    @IBOutlet weak var emailAddressField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailAddressField.becomeFirstResponder()
        // Do any additional setup after loading the view.
        
        if AppDelegate.defaultManager.user.email != nil && AppDelegate.defaultManager.user.email != "" {
            oldEmailLbl.text = AppDelegate.defaultManager.user.email
        }
        else {
            oldEmailLbl.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    @IBAction func didPressCancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    

}
