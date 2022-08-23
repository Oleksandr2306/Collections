//
//  MenuTableViewCell.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 21.08.2022.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
}
