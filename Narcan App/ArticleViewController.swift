//
//  ArticleViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/7/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressClose(_ sender: AnyObject) {
    
        dismiss(animated: true, completion: nil)
        
    }
    
    
   
}
