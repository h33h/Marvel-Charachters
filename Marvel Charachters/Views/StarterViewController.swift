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
    @IBOutlet private var titleView: UIView!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var titleLabel: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleLabel
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.sizeToFit()
        navigationController?.navigationBar.backgroundColor = .white
    }
    @IBAction private func filterAction(_ sender: Any) {
        searchButton.isHidden = true
        filterButton.isHidden = true
        backButton.isHidden = false
        func addCancelButton() -> UIAlertAction {
            UIAlertAction(title: "Cancel", style: .destructive, handler: {[weak self] _ in
                self?.textField.text = ""
                self?.textField.isHidden = true
                self?.backButton.isHidden = true
                self?.filterButton.isHidden = false
                self?.titleView.isHidden = false
                self?.searchButton.isHidden = false
            })
        }
        guard let mainVC = (self.children[0] as? MainViewController) else { return }
        let actionSheet = UIAlertController(title: "Filter", message: "Filter Charachters by:", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Name Ascending", style: .default, handler: { _ in
            mainVC.clearAllCharachters()
            mainVC.getPresenter().getCharachtersBy(filter: .filter(.name))
            mainVC.setCurrentFilter(filter: .filter(.name))
        }))
        actionSheet.addAction(UIAlertAction(title: "Name Descending", style: .default, handler: { _ in
            mainVC.clearAllCharachters()
            mainVC.getPresenter().getCharachtersBy(filter: .filter(.nameDescending))
            mainVC.setCurrentFilter(filter: .filter(.nameDescending))
        }))
        actionSheet.addAction(UIAlertAction(title: "Recent Modified", style: .default, handler: { _ in
            mainVC.clearAllCharachters()
            mainVC.getPresenter().getCharachtersBy(filter: .filter(.modified))
            mainVC.setCurrentFilter(filter: .filter(.modified))
        }))
        actionSheet.addAction(UIAlertAction(title: "Modified Descending", style: .default, handler: { _ in
            mainVC.clearAllCharachters()
            mainVC.getPresenter().getCharachtersBy(filter: .filter(.modifiedDescending))
            mainVC.setCurrentFilter(filter: .filter(.modifiedDescending))
        }))
        let action1 = UIAlertAction(title: "Comics ID", style: .default) {[weak self] _ in
            let alert = UIAlertController(title: "Filter by Comics ID", message: "Enter Comics ID", preferredStyle: .alert)
            alert.addTextField { _ in }
            alert.addAction(addCancelButton())
            alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { _ in
                guard let text = Int(alert.textFields?[0].text ?? "nil") else { return }
                mainVC.clearAllCharachters()
                mainVC.getPresenter().getCharachtersBy(filter: .comicsID(text))
                mainVC.setCurrentFilter(filter: .comicsID(text))
            }))
            self?.present(alert, animated: true, completion: {})
        }
        actionSheet.addAction(action1)
        let action2 = UIAlertAction(title: "Stories ID", style: .default) {[weak self] _ in
            let alert = UIAlertController(title: "Filter by Stories ID", message: "Enter Stories ID", preferredStyle: .alert)
            alert.addTextField { _ in }
            alert.addAction(addCancelButton())
            alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { _ in
                guard let text = Int(alert.textFields?[0].text ?? "nil") else { return }
                mainVC.clearAllCharachters()
                mainVC.getPresenter().getCharachtersBy(filter: .seriesID(text))
                mainVC.setCurrentFilter(filter: .storiesID(text))
            }))
            self?.present(alert, animated: true, completion: {})
        }
        actionSheet.addAction(action2)
        let action3 = UIAlertAction(title: "Series ID", style: .default) {[weak self] _ in
            let alert = UIAlertController(title: "Filter by Series ID", message: "Enter Series ID", preferredStyle: .alert)
            alert.addTextField { _ in }
            alert.addAction(addCancelButton())
            alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { _ in
                guard let text = Int(alert.textFields?[0].text ?? "nil") else { return }
                mainVC.clearAllCharachters()
                mainVC.getPresenter().getCharachtersBy(filter: .seriesID(text))
                mainVC.setCurrentFilter(filter: .seriesID(text))
            }))
            self?.present(alert, animated: true, completion: {})
        }
        actionSheet.addAction(action3)
        let action4 = UIAlertAction(title: "Events ID", style: .default) {[weak self] _ in
            let alert = UIAlertController(title: "Filter by Events ID", message: "Enter Events ID", preferredStyle: .alert)
            alert.addTextField { _ in }
            alert.addAction(addCancelButton())
            alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { _ in
                guard let text = Int(alert.textFields?[0].text ?? "nil") else { return }
                mainVC.clearAllCharachters()
                mainVC.getPresenter().getCharachtersBy(filter: .eventsID(text))
                mainVC.setCurrentFilter(filter: .eventsID(text))
            }))
            self?.present(alert, animated: true, completion: {})
        }
        actionSheet.addAction(action4)
        let action5 = UIAlertAction(title: "Modified Since", style: .default) {[weak self] _ in
            let alert = UIAlertController(title: "Filter by Modified Since", message: "Enter Date", preferredStyle: .alert)
            alert.addTextField { _ in }
            alert.addAction(addCancelButton())
            alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { _ in
                guard let text = alert.textFields?[0].text else { return }
                mainVC.clearAllCharachters()
                mainVC.getPresenter().getCharachtersBy(filter: .modifiedSince(text))
                mainVC.setCurrentFilter(filter: .modifiedSince(text))
            }))
            self?.present(alert, animated: true, completion: {})
        }
        actionSheet.addAction(action5)
        present(actionSheet, animated: true, completion: {})
    }
    @IBAction private func textEdit(_ sender: UITextField) {
        guard let mainVC = (children[0] as? MainViewController) else { return }
        guard let text = sender.text else { return }
        mainVC.clearAllCharachters()
        mainVC.getPresenter().getCharachtersBy(filter: .nameStartsWith(text))
        mainVC.setCurrentFilter(filter: .nameStartsWith(text))
    }
    @IBAction private func searchAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.textField.isHidden = false
            self.backButton.isHidden = false
            self.titleView.isHidden = true
            self.searchButton.isHidden = true
            self.filterButton.isHidden = true
        }
    }
    @IBAction private func backButton(_ sender: Any) {
        DispatchQueue.main.async {
            self.textField.text = ""
            self.textField.isHidden = true
            self.backButton.isHidden = true
            self.filterButton.isHidden = false
            self.titleView.isHidden = false
            self.searchButton.isHidden = false
        }
        guard let mainVC = (children[0] as? MainViewController) else { return }
        mainVC.clearAllCharachters()
        mainVC.getPresenter().getCharachtersBy(filter: .noSorted)
    }
}
