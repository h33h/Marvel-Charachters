//
//  DetailCharachterVC.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import UIKit

class DetailCharachterVC: UIViewController {

    private let imageLoadProxy = ImageProxy(service: LoadImageService())
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setHeroNameLabel (name: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
    func setHeroDescriptionLabel (name: String) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = name
        }
    }
    func setPreviewHeroImage (image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    func configure(charachter: Charachter) {
        setHeroNameLabel(name: charachter.name)
        setHeroDescriptionLabel(name: charachter.description)
        DispatchQueue.global().async {
            if let imageUrl = charachter.thumbnail.getImageUrl() {
                self.imageLoadProxy.laodImage(url: imageUrl) { [weak self] data, _, _ in
                    guard let data = data else {
                        return
                    }
                    self?.setPreviewHeroImage(image: UIImage(data: data))
                }
            }
        }
    }
}
