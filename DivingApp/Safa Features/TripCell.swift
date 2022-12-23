//
//  TripCell.swift
//  DivingApp
//
//  Created by Safa Juma on 23/12/2022.
//

import UIKit

class TripCell: UITableViewCell {
    
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
