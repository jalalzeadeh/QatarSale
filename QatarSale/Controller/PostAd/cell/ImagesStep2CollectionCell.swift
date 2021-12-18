//
//  ImagesStep2CollectionCell.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import UIKit

class ImagesStep2CollectionCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var coverLable: UILabel!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.coverView.backgroundColor = Colors.black.withAlphaComponent(0.5)
        self.coverLable.text = "Cover".localized()
        self.coverLable.font = Fonts.xXSmall
        self.coverLable.textColor = Colors.white
        self.mainView.backgroundColor = Colors.grayLight
        image.contentMode = .scaleAspectFill
        self.mainView.layer.cornerRadius = 4
        self.mainView.clipsToBounds = true
    }
    
    func populateCell(img: UIImage, isSelected: Bool, width: CGFloat, height: CGFloat) {
        self.image.image = img
        self.closeView.isHidden = !isSelected
        self.coverView.isHidden = !isSelected
        self.imageWidth.constant = width
        self.imageHeight.constant = height
    }

}
