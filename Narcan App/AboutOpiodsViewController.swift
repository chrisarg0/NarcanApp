//
//  AboutOpiodsViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 11/7/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class AboutOpiodsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var articleTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        navigationController?.navigationBar.barTintColor = UIColor(red:0.97, green:0.54, blue:0.38, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        // Do any additional setup after loading the view.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        
        return cell
        
    }
    
    @IBAction func didPressBack(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)

        
    }

    

}
