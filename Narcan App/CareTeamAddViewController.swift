//
//  CareTeamAddViewController.swift
//  Narcan App
//
//  Created by Liming on 02/11/2016.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class CareTeamAddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var roleText: UITextField!
    
    @IBOutlet weak var roleSwitch: UISwitch!
    
    let roleArray = ["Mother", "Father", "Loved one", "Primary physician"]
    var rolePicker: UIPickerView!
    
    var mCare : NarcanCare!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        rolePicker = UIPickerView()
        rolePicker.delegate = self
        roleText.inputView = rolePicker
        
        if self.mCare != nil {
            self.firstNameText.text = self.mCare.first_name
            self.lastNameText.text = self.mCare.last_name
            self.emailText.text = self.mCare.email
            self.phoneText.text = self.mCare.phone
            self.roleText.text = self.mCare.role
            self.roleSwitch.isOn = self.mCare.notification
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextField with UIPickerView
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.roleArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.roleArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        roleText.text = self.roleArray[row]
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveAction(_ sender: Any) {
        if self.firstNameText.text == "" {
            showAlert(_message: "Please input the first name.")
            return
        }
        
        if self.lastNameText.text == "" {
            showAlert(_message: "Please input the last name.")
            return
        }
        
        if self.emailText.text == "" {
            showAlert(_message: "Please input the email.")
            return
        }
        
        if self.phoneText.text == "" {
            showAlert(_message: "Please input the phone number.")
            return
        }
        
        if self.roleText.text == "" {
            showAlert(_message: "Please input the role.")
            return
        }
        
        let care = NarcanCare()
        
        care.first_name = self.firstNameText.text
        care.last_name = self.lastNameText.text
        care.email = self.emailText.text
        care.phone = self.phoneText.text
        care.role = self.roleText.text
        care.notification = self.roleSwitch.isOn
        
        if self.mCare != nil {
            AppDelegate.defaultManager.mCareUsers.replaceObject(at: AppDelegate.defaultManager.mCareUsers.index(of: self.mCare), with: care)
        }
        else {
            AppDelegate.defaultManager.mCareUsers.add(care)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(_message : String)  {
        let alertControler = UIAlertController(title: "Error", message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction) in
            
        })
        
        alertControler.addAction(okAction)
        self.present(alertControler, animated: true, completion: nil)
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
