//
//  ViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class MenuViewController: UITableViewController {

    @IBOutlet weak private var menuTable: UITableView!
    
    private enum menuOptions: String, CaseIterable {
        case array = "Array"
        case set = "Set"
        case dictionary = "Dictionary"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        menuTable.dataSource = self
//        menuTable.delegate = self
//        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        cell.setTitle(title: menuOptions.allCases[indexPath.row].rawValue)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goTo\(menuOptions.allCases[indexPath.row].rawValue)", sender: self)
    }
    
}
