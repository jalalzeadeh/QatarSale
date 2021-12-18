//
//  CategoryTableViewCell.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateCell(cat: Category, isSelected: Bool){
        self.titleLabel.text = cat.name
        self.titleLabel.font = Fonts.small
        self.checkImage.isHidden = !isSelected
        self.titleLabel.textColor = isSelected ? Colors.blue : Colors.grayDark
        self.mainView.backgroundColor = isSelected ? Colors.blue.withAlphaComponent(0.3) : Colors.white
        self.mainView.layer.borderWidth = 0.6
        self.mainView.layer.borderColor = isSelected ? Colors.blue.cgColor : Colors.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
