//
//  MainCell.swift
//  iOS-best-practices
//
//  Created by Sir.DNT on 4/8/19.
//  Copyright © 2019 Sir.DNT. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
