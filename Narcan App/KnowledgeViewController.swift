//
//  KnowledgeViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController {
// https://argo-ca-dev-ed.my.salesforce.com/sfc/p/j0000000Idbj/a/j0000000D3v6/MIzbynVvJSYo6aNbQbvAuQ9jDWr_CQeWzx.VkQY46uU
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDidPress(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
