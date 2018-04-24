//
//  ThirdViewController.swift
//  ImageSlider
//
//  Created by MacMini3 on 20/03/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var searchBar: UISearchBar!
    var isSearch: Bool = false
    
    var arrValues = [String]()
    var arrFilteredValues = [String]()
    
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x:0, y:0, width:self.view.frame.width-100, height:20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        arrValues = ["one", "two","three","Four"]

        // Do any additional setup after loading the view.
        searchBar.placeholder = "Search something"
        let rightNavBarItem = UIBarButtonItem(customView: searchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarItem
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isSearch) {
            return arrFilteredValues.count
        }
        return arrValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if (isSearch) {
        cell.textLabel?.text = arrFilteredValues[indexPath.row]
        }
        else {
        cell.textLabel?.text = arrValues[indexPath.row]
        }
        
        return cell
    }
    
    //below are the searchbar delegates
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isSearch = false
            tableView.reloadData()
        }
        else {
            arrFilteredValues = arrValues.filter({ (text) -> Bool in
                let tmp:String = text
                //let range = tmp.rangeOfString(searchText, options: NSString.CompareOptions.CaseInsensitiveSearch)
                let range = tmp.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil)
                return range != nil
            })
            if (arrFilteredValues.count == 0) {
                isSearch = false
            }
            else {
                isSearch = true
            }
            tableView.reloadData()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
