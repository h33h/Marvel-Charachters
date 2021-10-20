//
//  DetailCharachterVC.swift
//  Marvel Charachters
//
//  Created by XXX on 20.10.21.
//

import UIKit

class DetailCharachterVC: UIViewController {
    private var charachter = Charachter()
    private let nameLabel = UILabel(frame: .zero)
    private let imageLoadProxy = ImageProxy(service: LoadImageService())
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var buttonStackView: UIStackView!
    @IBOutlet private var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.sizeToFit()
        descriptionTextView.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .black)
        nameLabel.textColor = .red
        navigationItem.titleView = nameLabel
        navigationItem.hidesBackButton = true
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward",
                                                        withConfiguration: largeConfig),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonAction))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        configure(charachter: charachter)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonStackView.subviews.forEach { $0.layer.frame = CGRect(x: $0.layer.frame.minX,
                                                                   y: $0.layer.frame.minY,
                                                                   width: $0.frame.width + 5,
                                                                   height: $0.frame.height)
        }
    }
    @IBAction private func comicsAction(_ sender: Any) {
        let partVC = CharacterParticipationViewController()
        partVC.setList(list: charachter.comics?.items)
        navigationController?.pushViewController(partVC, animated: true)
    }
    @IBAction private func seriesAction(_ sender: Any) {
        let partVC = CharacterParticipationViewController()
        partVC.setList(list: charachter.series?.items)
        navigationController?.pushViewController(partVC, animated: true)
    }
    @IBAction private func storiesAction(_ sender: Any) {
        let partVC = CharacterParticipationViewController()
        partVC.setList(list: charachter.stories?.items)
        navigationController?.pushViewController(partVC, animated: true)
    }
    @IBAction private func eventsAction(_ sender: Any) {
        let partVC = CharacterParticipationViewController()
        partVC.setList(list: charachter.events?.items)
        navigationController?.pushViewController(partVC, animated: true)
    }
    private func setHeroNameLabel (name: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
    private func setHeroDescriptionLabel (name: String) {
        DispatchQueue.main.async {
            self.descriptionTextView.text = name
        }
    }
    private func setPreviewHeroImage (image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    func setCharachter(charachter: Charachter) {
        self.charachter = charachter
    }
    private func configure(charachter: Charachter) {
        guard let name = charachter.name else { return }
        setHeroNameLabel(name: name)
        if let description = charachter.description {
            setHeroDescriptionLabel(name: description)
        }
        DispatchQueue.global().async {
            if let imageUrl = charachter.thumbnail?.getImageUrl() {
                self.imageLoadProxy.laodImage(url: imageUrl) { [weak self] data, _, _ in
                    guard let data = data else {
                        return
                    }
                    self?.setPreviewHeroImage(image: UIImage(data: data))
                }
            }
        }
    }
    @objc
    func backButtonAction(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
