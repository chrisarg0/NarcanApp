//
//  DefaultViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/6/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {

    @IBOutlet weak var introWarning: UIImageView!
    @IBOutlet weak var requestButton: UIButton!
    
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestButton.alpha = 0
        requestButton.frame.origin.y = 300
        
        introWarning.alpha = 0
        introWarning.frame.origin.y = 623
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
                self.requestButton.frame.origin.y = 246
                self.requestButton.alpha = 1
                    }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
            self.introWarning.frame.origin.y = 503
            self.introWarning.alpha = 1

        }, completion: nil)
        
        
    }

    @IBAction func didTapEsc(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
            self.introWarning.frame.origin.y = 623
            self.introWarning.alpha = 0
            
        }, completion: nil)
    }
    
    
}
