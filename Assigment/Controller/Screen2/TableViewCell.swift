//
//  TableViewCell.swift
//  Assigment
//
//  Created by lov niveriya on 17/09/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var SceondLabel: UILabel!
    @IBOutlet weak var Imaget: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
