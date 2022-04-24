//
//  DetailTableViewCell.swift
//  RealAPIApp
//
//  Created by Eren Demir on 24.04.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myEmail: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
