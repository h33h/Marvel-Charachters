//
//  CharacterParticipationViewController.swift
//  Marvel Charachters
//
//  Created by XXX on 21.10.21.
//

import UIKit

class CharacterParticipationViewController: UIViewController {
    private var list: [SummaryProtocol]?
    @IBOutlet private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    func setList(list: [SummaryProtocol]?) {
        self.list = list
    }
}

extension CharacterParticipationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list?.count ?? 0
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = list?[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
}
