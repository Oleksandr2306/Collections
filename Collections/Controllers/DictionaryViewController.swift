//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak private var arrayTable: UITableView!
    @IBOutlet weak private var dictionaryTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Dictionary: \(Int.random(in: 0...9999))"
        navigationItem.largeTitleDisplayMode = .never
        
        arrayTable.delegate = self
        arrayTable.dataSource = self
        dictionaryTable.delegate = self
        dictionaryTable.dataSource = self
    }
}

extension DictionaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension DictionaryViewController: UITableViewDelegate {
    
}
