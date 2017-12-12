//
//  NotesViewCell.swift
//  CoreDataNotes
//
//  Created by MacMini3 on 12/12/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

import UIKit

class NotesViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitile: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //get data from the entity(core data)
    func setNotes(note:MyNotes) {
        
        lblTitile.text = note.title
        lblDescription.text = note.note_description
        
        //format the date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let currentDate = dateFormat.string(from: note.date_save as! Date)
        lblDate.text = currentDate
    }
    

    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
