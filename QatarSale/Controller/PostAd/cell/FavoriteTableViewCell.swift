//
//  FavoriteTableViewCell.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.nameLabel.font = Fonts.xXSmallMedium
    }
    
    func populateCell(fav: Favorite) {
        nameLabel.text = fav.name
        imgView.image = fav.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
