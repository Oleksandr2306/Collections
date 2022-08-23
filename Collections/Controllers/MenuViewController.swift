//
//  ViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class MenuViewController: UIViewController {

    @IBOutlet weak private var menuTable: UITableView!
    
    private let menuOptions = ["Array", "Set", "Dictionary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        menuTable.dataSource = self
        menuTable.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        cell.setTitle(title: menuOptions[indexPath.row])
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoTo\(menuOptions[indexPath.row])", sender: self)
    }
}
