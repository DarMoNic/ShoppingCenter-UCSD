//
//  ChangePasswordViewController.swift
//  ShoppingCenter@UCSD
//
//  Created by Darya Verzhbinsky on 4/8/18.
//  Copyright © 2018 DarMoNic. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var currentPasswordText: UITextField!
    @IBOutlet weak var newPasswordText: UITextField!
    @IBOutlet weak var newPasswordConfirmText: UITextField!
    
    
    @IBAction func changePasswordPressed(_ sender: Any) {
        
        let currentPassword = currentPasswordText.text!;
        let newPassword = newPasswordText.text!;
        let confirmedNewPassword = newPasswordConfirmText.text!;
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        
        //empty fields
        if(currentPassword.isEmpty || newPassword.isEmpty || confirmedNewPassword.isEmpty) {
            
            //error message
            displayAlertMessage(userMessage: "All Fields Are Required");
            return;
        }
        
        //if given password doesn't match password in "database"
        if(currentPassword != userPasswordStored) {
            displayAlertMessage(userMessage: "Current Password Is Invalid");
            return;
        }
        
        //if email matches one in "database"
        if(newPassword == confirmedNewPassword) {
            
            UserDefaults.standard.set(newPassword, forKey: "userPassword");
            
            let alert = UIAlertController(title: "Passwords Match", message: "You Have Successfully Changed Your Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK - back to Sign In", style: .default) { (action) -> Void in
                let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "FirstPage")
                self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
            }
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        } else {
            displayAlertMessage(userMessage: "Passwords Do Not Match");
            return;
        }
        
        
    }
    
    
    func displayAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok",  style: UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil);
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
