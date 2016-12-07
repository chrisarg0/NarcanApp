//
//  TeamTabViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/6/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class TeamTabViewController: UIViewController {

    @IBOutlet var avatars: [UIButton]!
    var selectedIndex: Int = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressAvatar(_ sender: Any) {
        
        let previousIndex = selectedIndex
        
        selectedIndex = (sender as AnyObject).tag
        
        avatars[previousIndex].isSelected = false
        
//        let previousVC = viewControllers[previousIndex]
//        
//        previousVC.willMove(toParentViewController: nil)
//        previousVC.view.removeFromSuperview()
//        previousVC.removeFromParentViewController()
//        
//        sender.isSelected = true
//        let vc = viewControllers[selectedIndex]
//        addChildViewController(vc)
//        
//        vc.view.frame = contentView.bounds
//        contentView.addSubview(vc.view)
//        
//        func viewDidAppear(_ animated: Bool) {
//            vc.didMove(toParentViewController: self)
        
    }

    

}
