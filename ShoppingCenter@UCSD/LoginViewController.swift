//
//  LoginViewController.swift
//  ShoppingCenter@UCSD
//
//  Created by Darya Verzhbinsky on 4/8/18.
//  Copyright © 2018 DarMoNic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailText.text!;
        let userPassword = userPasswordText.text!;
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        if(userEmail == userEmailStored) {
            if(userPassword == userPasswordStored) {
                // login is successful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                UserDefaults.standard.synchronize();
                //self.dismiss(animated: true, completion: nil);
                
                let alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                    let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "HomePage")
                    self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                displayAlertMessage(userMessage: "Password Does Not Match");
                return;
            }
        } else {
            displayAlertMessage(userMessage: "Email Does Not Exist");
            return;
        }
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
