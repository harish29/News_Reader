//
//  cellviewTableViewCell.swift
//  JsonNews
//
//  Created by Geeksoft llc on 2/5/17.
//  Copyright © 2017 Geeksoft llc. All rights reserved.
//

import UIKit

class cellviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var txt: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var aut: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
