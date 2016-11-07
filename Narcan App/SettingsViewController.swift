//
//  SettingsViewController.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import SDWebImage

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fullnameLbl: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if AppDelegate.defaultManager.user.display_name != nil && AppDelegate.defaultManager.user.display_name != "" {
            self.fullnameLbl.text = AppDelegate.defaultManager.user.display_name.uppercased()
        }
        
        //if AppDelegate.defaultManager.user.thumbnail != nil && AppDelegate.defaultManager.user.thumbnail != "" {
          //  let imageUrlWithToken = "\(AppDelegate.defaultManager.user.thumbnail!)?oauth_token=\(AppDelegate.defaultManager.access_token!)"
            //self.avatarImageView.sd_setImage(with: URL(string: imageUrlWithToken)!, placeholderImage: UIImage(named: "avatar.png")!)
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backDidPress(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)

        
    }
    
    @IBAction func didPressProfilePic(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let chooseFromLibrary = UIAlertAction(title: "Choose From Library", style: .default) { (action) in
            
            //self.performSegue(withIdentifier: "", sender: nil)
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        alertController.addAction(chooseFromLibrary)
        
        let takeProfilePicture = UIAlertAction(title: "Take Profile Picture", style: .default) { (action) in
            
            //self.performSegue(withIdentifier: "", sender: nil)
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        alertController.addAction(takeProfilePicture)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        avatarImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
}
