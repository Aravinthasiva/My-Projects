//
//  ViewController.swift
//  Age Finder
//
//  Created by MacMini3 on 07/12/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtYearOfBirth: UITextField!
    @IBOutlet weak var lblAge: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAge.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnFindAge(_ sender: Any) {
        
        findAge()
    }
    
    func findAge() {
        let yearOfBirth = Int(txtYearOfBirth.text!)
        let date = Date()
        let calender = Calendar.current
        let year = calender.component(.year, from: date)
        let age = year - yearOfBirth!
        lblAge.text = "Your age is \(age) years"
        lblAge.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        findAge()
        //click return from keboard to close keyboard
        return true
    }
}

