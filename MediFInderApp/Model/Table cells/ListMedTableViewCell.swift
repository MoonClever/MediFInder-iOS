//
//  ListMedTableViewCell.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class ListMedTableViewCell: UITableViewCell {

    @IBOutlet weak var listMedImage: UIImageView!
    @IBOutlet weak var listMedBrand: UILabel!
    @IBOutlet weak var listMedGenericName: UILabel!
    @IBOutlet weak var listMedQuantity: UILabel!
    @IBOutlet weak var listMedInterval: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
