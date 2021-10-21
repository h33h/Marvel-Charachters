//
//  ViewController.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import UIKit

class MainViewController: UICollectionViewController {
    private let charachterPresenter = CharachterPresenter(charachterService: CharachterService())
    private let reuseIdentifier = String(describing: CharachterCell.self)
    private var lastIndexPath = IndexPath(row: 0, section: 0)
    private var currentFilter = HeroFilter.noSorted
    private var charachters = [Charachter]()
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
        charachterPresenter.getCharachtersBy(filter: currentFilter)
    }
    func getPresenter() -> CharachterPresenter {
        charachterPresenter
    }
    func setCurrentFilter(filter: HeroFilter) {
        currentFilter = filter
    }
    func clearAllCharachters() {
        charachters.removeAll()
    }
}

extension MainViewController: CharachterViewDelegate {
    func displayAllCharachters(charachters: [Charachter]) {
        charachters.forEach { self.charachters.append($0) }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func displaySelectedCharachter(charachters: [Charachter]) {
        self.charachters = charachters
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CharachterCell
        guard let cell = cell else { return UICollectionViewCell() }
        let char = charachters[indexPath.row]
        cell.configure(charachter: char)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charachters.count
    }
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row % 15 == 0) && lastIndexPath.row < indexPath.row {
            charachterPresenter.getCharachtersBy(filter: currentFilter, offset: charachters.count, limit: 20)
            lastIndexPath = indexPath
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailCharachterVC()
        detailVC.setCharachter(charachter: charachters[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
