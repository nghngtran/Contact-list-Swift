//
//  TableViewCell.swift
//  Contact
//
//  Created by NGUYEN HOANG NGOC TRAN on 8/6/20.
//  Copyright © 2020 NGUYEN HOANG NGOC TRAN. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet public weak var checkerImageView: UIImageView!
    @IBOutlet public weak var imgView: UIImageView!
    @IBOutlet public weak var nameLabel: UILabel!
    
    let uncheckedImage = UIImage(named: "ic_check_box")! as UIImage
    let checkedImage = UIImage(named: "ic_check_box_outline_blank")!
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                checkerImageView.image = checkedImage
            } else {
                checkerImageView.image = uncheckedImage
            }
        }
    }
    
    func check() {
        self.isChecked.toggle()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkerImageView.layer.cornerRadius = checkerImageView.frame.width / 2
        checkerImageView.image = uncheckedImage
        
        imgView.layer.cornerRadius = imgView.frame.width / 2
    }
}
