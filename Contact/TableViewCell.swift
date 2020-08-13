//
//  TableViewCell.swift
//  Contact
//
//  Created by NGUYEN HOANG NGOC TRAN on 8/6/20.
//  Copyright © 2020 NGUYEN HOANG NGOC TRAN. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var checkBtn: UIButton!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet weak var contactNameView: UITextView!
    
    let checkedImage = UIImage(named: "ic_check_box")! as UIImage
    let uncheckedImage = UIImage(named: "ic_check_box_outline_blank")!
    
    @IBAction func onPressed(_ sender: Any) {
        
    }
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                checkBtn.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                checkBtn.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBtn.layer.cornerRadius = 50
        imageView?.layer.cornerRadius = 90
            imageView?.layer.masksToBounds = true
    }
    @IBAction func checkBoxBtn(_ sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
