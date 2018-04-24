//
//  ViewController.swift
//  NetworkImageRequest
//
//  Created by MacMini3 on 24/04/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")
        let task = URLSession.sharedSession.dataTask(with: imageURL) { (data, response, error) in
            print("task finished")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

