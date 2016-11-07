//
//  FAQSViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/7/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class FAQSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red:0.42, green:0.74, blue:0.43, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(_
        sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)

    }

    

}
