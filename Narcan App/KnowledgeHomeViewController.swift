//
//  KnowledgeHomeViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/6/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class KnowledgeHomeViewController: UIViewController {

    @IBOutlet weak var articleType1: UIButton!
    @IBOutlet weak var articleType2: UIButton!
    @IBOutlet weak var articleType3: UIButton!
    @IBOutlet weak var articleType4: UIButton!
    @IBOutlet weak var articleType5: UIButton!
    @IBOutlet weak var articleType6: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        articleType1.frame.origin.y = 200
        articleType2.frame.origin.y = 200
        articleType3.frame.origin.y = 200
        articleType4.frame.origin.y = 200
        articleType5.frame.origin.y = 200
        articleType6.frame.origin.y = 200
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.articleType1.frame.origin.y = 25
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.articleType2.frame.origin.y = 130
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.articleType3.frame.origin.y = 25
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.articleType4.frame.origin.y = 130
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.articleType5.frame.origin.y = 25
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.articleType6.frame.origin.y = 130
            }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
