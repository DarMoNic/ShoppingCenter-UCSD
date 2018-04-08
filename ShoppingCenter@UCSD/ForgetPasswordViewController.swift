//
//  ForgetPasswordViewController.swift
//  ShoppingCenter@UCSD
//
//  Created by Darya Verzhbinsky on 4/8/18.
//  Copyright © 2018 DarMoNic. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var ConfirmEmail: UITextField!
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        
        let userEmail = EmailText.text!;
        let confirmedEmail = ConfirmEmail.text!;
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        
        //empty fields
        if(userEmail.isEmpty || confirmedEmail.isEmpty) {
            
            //error message
            displayAlertMessage(userMessage: "All Fields Are Required");
            return;
        }
        
        //if fields don't match
        if(userEmail != confirmedEmail) {
            displayAlertMessage(userMessage: "Emails Do Not Match");
            return;
        }
        
        //if email matches one in "database"
        if(userEmail == userEmailStored) {
            
            let alert = UIAlertController(title: "Emails Match", message: "You Will Be Emailed With New Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK - back to Sign In", style: .default) { (action) -> Void in
                let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "FirstPage")
                self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
            }
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
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
