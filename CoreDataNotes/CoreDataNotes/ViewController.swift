//
//  ViewController.swift
//  CoreDataNotes
//
//  Created by MacMini3 on 12/12/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    
    var EditNote:MyNotes?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let note = EditNote {
            txtTitle.text = note.title
            txtDescription.text = note.note_description
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnAddNote(_ sender: Any) {
        
        var newNote: MyNotes?
        if let note = EditNote {
            newNote = note
        }else {
            //save notes to my entity
            newNote = MyNotes(context: context)
        }
//        //save notes to my entity
//        newNote = MyNotes(context: context)
        newNote?.title = txtTitle.text
        newNote?.note_description = txtDescription.text
        newNote?.date_save = NSDate() as Date
        do {
            ad.saveContext()
            txtTitle.text = ""
            txtDescription.text = ""
        } catch  {
            print("can't save")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

