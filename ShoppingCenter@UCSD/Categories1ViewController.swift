//
//  Categories1ViewController.swift
//  ShoppingCenter@UCSD
//
//  Created by Nicole Martindale on 4/8/18.
//  Copyright © 2018 DarMoNic. All rights reserved.
//

import UIKit

class Categories1ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var selection: UIButton!
    
    let categories = ["Clothes", "Books", "Rides", "Apartments/Living"]
    
    override func viewDidLoad() {
        
        pickerView1.isHidden = true
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectPressed(_ sender: UIButton) {
        if pickerView1.isHidden {
            pickerView1.isHidden = false
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selection.setTitle(categories[row], for: .normal)
        pickerView1.isHidden = true
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
