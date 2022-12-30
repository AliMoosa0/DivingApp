//
//  EquipmentCell.swift
//  DivingApp
//
//  Created by ALI MOOSA and Safa Juma on 29/12/2022.
//

import UIKit

protocol EquipmentCellDelegate: AnyObject{
    func checkmarkTapped(sender: EquipmentCell)
}

class EquipmentCell: UITableViewCell {

    weak var delegate: EquipmentCellDelegate?
    
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var equipmentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
}
