//
//  TableViewCell.swift
//  DemoApp
//
//  Created by Phạm Thanh Tú on 19/09/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
