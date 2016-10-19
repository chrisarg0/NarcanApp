//
//  ViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import Alamofire
import RevealingSplashView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "NarcanFinderAppIcon@1x")!,iconInitialSize: CGSize(width: 181, height: 181), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

