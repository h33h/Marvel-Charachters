//
//  CharachterCell.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import UIKit

class CharachterCell: UICollectionViewCell {

    private let imageLoadProxy = ImageProxy(service: LoadImageService())
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
    func configure(charachter: Charachter) {
        guard let name = charachter.name else { return }
        setHeroNameLabel(name: name)
        DispatchQueue.global().async {
            if let imageUrl = charachter.thumbnail?.getImageUrl() {
                self.imageLoadProxy.laodImage(url: imageUrl) { [weak self] data in
                    guard let data = data else {
                        return
                    }
                    self?.setPreviewHeroImage(image: UIImage(data: data))
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
