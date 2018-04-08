//
//  AccountInfoViewController.swift
//  ShoppingCenter@UCSD
//
//  Created by Darya Verzhbinsky on 4/8/18.
//  Copyright © 2018 DarMoNic. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController {

    @IBOutlet weak var emailTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        emailTextLabel.text = userEmailStored;

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
