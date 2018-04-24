//
//  CustomCollectionViewCell.swift
//  ImageSlider
//
//  Created by MacMini3 on 05/03/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override var bounds: CGRect {
        didSet {
            imgView.frame = bounds
        }
    }
}
