//
//  CharachterCell.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import UIKit

class CharachterCell: UICollectionViewCell {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    func setHeroNameLabel (name: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
    
    func setPreviewHeroImage (image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
