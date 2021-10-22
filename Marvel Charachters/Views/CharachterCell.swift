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
    @IBOutlet private var activity: UIActivityIndicatorView!
    @IBOutlet private var nameLabel: UILabel!
    private func setHeroNameLabel (name: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
    private func setPreviewHeroImage (image: UIImage?) {
        DispatchQueue.main.async {
            guard let image = image else {
                self.imageView.image = nil
                self.imageView.isHidden = true
                self.activity.startAnimating()
                return
            }
                self.imageView.image = image
                self.activity.stopAnimating()
                self.imageView.isHidden = false
        }
    }
    func configure(name: String, imageUrl: URL) {
        setHeroNameLabel(name: name)
        imageLoadProxy.loadImage(url: imageUrl) {[weak self] data in
            if let data = data {
                self?.setPreviewHeroImage(image: UIImage(data: data))
            } else {
                self?.setPreviewHeroImage(image: nil)
            }
        }
    }
    override func prepareForReuse() {
        self.setPreviewHeroImage(image: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
