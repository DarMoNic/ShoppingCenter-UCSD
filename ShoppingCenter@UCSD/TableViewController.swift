//
//  TableViewController.swift
//  ShoppingCenter@UCSD
//
//  Created by Nicole Martindale on 4/8/18.
//  Copyright © 2018 DarMoNic. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var productNameText: UITextField!
    @IBOutlet weak var productPriceText: UITextField!
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self

        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
                image.sourceType = .camera
                self.present(image, animated: true, completion: nil)
            } else {
                print("Camera not available")
            }

        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in image.sourceType = .photoLibrary
            self.present(image, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
//        let image = UIImagePickerController()
//        image.delegate = self
//
//        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
//
//        image.allowsEditing = false
//
//        self.present(image, animated: true)
//        {
//            //After it is complete
//        }
//    }
//
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        myImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
        
//        else {
//            //Error message
//        }
//        self.dismiss(animated: true, completion: nil)
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     @IBAction func productCreatedTapped(_ sender: UIButton) {
        let productName = productNameText.text!;
        let productPrice = productPriceText.text!;
        
        //empty fields
        if(productName.isEmpty || productPrice.isEmpty) {
            
            //error message
            displayAlertMessage(userMessage: "All Fields Are Required");
            return;
        }
        
        //store data
        UserDefaults.standard.set(productName, forKey: "productName");
        UserDefaults.standard.set(productPrice, forKey: "productPrice");
        UserDefaults.standard.synchronize();
        
        //display confirmation message
//        let myAlert = UIAlertController(title:"Alert", message:"Creation is Successful!. View Products", preferredStyle: UIAlertControllerStyle.alert);
//
//        let okAction = UIAlertAction(title:"Ok",  style: UIAlertActionStyle.default) { action in
//            self.dismiss(animated: true, completion: nil);
//        }
//
//        myAlert.addAction(okAction);
//        self.present(myAlert, animated: true, completion: nil);
        let myAlert = UIAlertController(title: "Alert", message: "Success! View Products.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "TableViewThing")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)

    }
    
    func displayAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok",  style: UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil);
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
