//
//  SearchMedTableViewCell.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class SearchMedTableViewCell: UITableViewCell {

    @IBOutlet weak var medImage: UIImageView!
    @IBOutlet weak var medBrandName: UILabel!
    @IBOutlet weak var medGenericName: UILabel!
    @IBOutlet weak var medManufacturer: UILabel!
    @IBOutlet weak var medRoute: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
