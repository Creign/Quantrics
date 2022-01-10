//
//  CarsTableViewCell.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/11/22.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
