//
//  ViewController.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import UIKit

class MainViewController: UICollectionViewController {
    private let charachterPresenter = CharachterPresenter(charachterService: CharachterService())
    private let imageLoadProxy = ImageProxy(service: LoadImageService())
    private let reuseIdentifier = String(describing: CharachterCell.self)
    private var charachters = [Charachter]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private var selectedCharachter: Charachter? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.3, height: UIScreen.main.bounds.height / 2.6)
        collectionView.collectionViewLayout = layout
        charachterPresenter.setViewDelegate(charachterViewDelegate: self)
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        charachterPresenter.getAllCharachters(limit: 20)
    }
}

extension MainViewController: CharachterViewDelegate {
    func displayAllCharachters(charachters: [Charachter]) {
        self.charachters = charachters
    }
    func displaySelectedCharachter(charachter: Charachter) {
        self.selectedCharachter = charachter
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CharachterCell
        guard let cell = cell else { return UICollectionViewCell() }
        let char = charachters[indexPath.row]
        cell.setHeroNameLabel(name: char.name)
        if let imageUrl = char.thumbnail.getImageUrl() {
            imageLoadProxy.laodImage(url: imageUrl) { data, _, _ in
                guard let data = data else {
                    return
                }
                cell.setPreviewHeroImage(image: UIImage(data: data))
            }
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charachters.count
    }
}
