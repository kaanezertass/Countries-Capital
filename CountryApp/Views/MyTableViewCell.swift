//
//  MyTableViewCell.swift
//  CountryApp
//
//  Created by Kaan Ezerrtaş on 4.12.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var capitalName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
