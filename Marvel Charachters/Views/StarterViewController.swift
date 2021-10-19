//
//  StarterViewController.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import UIKit

class StarterViewController: UIViewController {

    @IBOutlet private var textField: UITextField!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var filterButton: UIButton!
    @IBOutlet private var titleLabel: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func filterAction(_ sender: Any) {
    }
    @IBAction private func textEdit(_ sender: UITextField) {
        guard let mainVC = (children[0] as? MainViewController) else { return }
        guard let text = sender.text else { return }
        mainVC.getPresenter().getSelectedCharachter(nameStartsWith: text)
    }
    @IBAction private func searchAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.textField.isHidden = false
            self.backButton.isHidden = false
            self.filterButton.isHidden = true
        }
    }
    @IBAction private func backButton(_ sender: Any) {
        DispatchQueue.main.async {
            self.textField.text = ""
            self.textField.isHidden = true
            self.backButton.isHidden = true
            self.filterButton.isHidden = false
        }
        guard let mainVC = (children[0] as? MainViewController) else { return }
        mainVC.clearAllCharachters()
        mainVC.getPresenter().getMoreCharachters(offset: 0, limit: 20)
    }
}
