//
//  ElementTVCell.swift
//  PeriodicTable-iOS
//
//  Created by Sami Saleh on 6/20/22.
//

import UIKit

class ElementTVCell: UITableViewCell {

    @IBOutlet private var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static public func NibString() -> String {
        return "ElementTVCell"
    }

    static public func IdentifierString() -> String {
        return "ElementCell"

    }


    func SetName(str : String) {
        label.text = str
    }
    
}
