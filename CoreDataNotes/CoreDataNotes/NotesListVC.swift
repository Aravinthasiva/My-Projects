//
//  NotesListVC.swift
//  CoreDataNotes
//
//  Created by MacMini3 on 12/12/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

import UIKit
import CoreData

class NotesListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    //take number of row as array from local db
    var listOfNotes = [MyNotes]()
    
//    @IBAction func btnBack(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
//

    override func viewDidLoad() {
        super.viewDidLoad()
        LoadNotes()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        //return 248
        return 250
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //take a cell whoch is instance of NotesViewCell class
        let cell:NotesViewCell = tableView.dequeueReusableCell(withIdentifier: "CellForNotes", for: indexPath) as! NotesViewCell
        cell.setNotes(note: listOfNotes[indexPath.row])
        
        //do delete action
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(btnDeletePressed(_:)), for: .touchUpInside)
        
        //do edit action
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(btnEditPressed(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func btnDeletePressed(_ sender:UIButton) {
        print("index \(sender.tag)")
        context.delete(listOfNotes[sender.tag])
        LoadNotes()
    }
    
    @objc func btnEditPressed(_ sender:UIButton) {
        
        performSegue(withIdentifier: "EditOrAddSegue", sender: listOfNotes[sender.tag])
    }
    
    //when we perform segue, there should be amethod which is below,
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditOrAddSegue" {
            if let AddOrEdit = segue.destination as? ViewController {
                if let myNote = sender as? MyNotes {
                    AddOrEdit.EditNote = myNote
                    
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func btnAddNote(_ sender: Any) {
        
        performSegue(withIdentifier: "EditOrAddSegue", sender: nil)
    }
    
    func LoadNotes() {
        //fetch datas form local db
        let fetchData:NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        do{
        listOfNotes = try context.fetch(fetchData)
            tblView.reloadData()
        }catch{
            print("Error while fetching")
        }
        
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
