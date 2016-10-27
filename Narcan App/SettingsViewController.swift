//
//  SettingsViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backDidPress(_ sender: AnyObject) {
        
        navigationController!.popViewController(animated: true)
        
    }
    
    @IBAction func didPressProfilePic(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let chooseFromLibrary = UIAlertAction(title: "Choose From Library", style: .default) { (action) in
            
            //self.performSegue(withIdentifier: "", sender: nil)
        }
        
        alertController.addAction(chooseFromLibrary)
        
        let takeProfilePicture = UIAlertAction(title: "Take Profile Picture", style: .default) { (action) in
            
            //self.performSegue(withIdentifier: "", sender: nil)
        }
        
        alertController.addAction(takeProfilePicture)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
    }
    


}
