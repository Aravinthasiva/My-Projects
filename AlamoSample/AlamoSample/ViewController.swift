//
//  ViewController.swift
//  AlamoSample
//
//  Created by MacMini3 on 08/11/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrData = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar.arrayObject {
                    self.arrData = resData as! [[String:AnyObject]]
                    print(resData)
                }
                if self.arrData.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var dict = arrData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dict["userId"] as? String
        cell.detailTextLabel?.text = dict["id"] as? String
        return cell
    }

}

