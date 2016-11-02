//
//  CareTeamViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/27/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class CareTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }

    @IBAction func backAction(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.defaultManager.mCareUsers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) 
        let nameLbl = cell.viewWithTag(100) as! UILabel
        let roleLbl = cell.viewWithTag(101) as! UILabel
        
        let care = AppDelegate.defaultManager.mCareUsers.object(at: indexPath.row) as! NarcanCare
        nameLbl.text = "\(care.first_name!) \(care.last_name!)"
        roleLbl.text = "\(care.role!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
}
