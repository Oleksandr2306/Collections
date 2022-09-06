//
//  ArrayStartingTableViewCell.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let arrayMenuOptions = ["Insert 1000 elements at the beginning one-by-one",
                                   "Insert 1000 elements at the beginning",
                                   "Insert 1000 elements in the middle one-by-one",
                                   "Insert 1000 elements in the middle",
                                   "Insert 1000 elements at the end one-by-one",
                                   "Insert 1000 elements at the end",
                                   "Remove 1000 elements at the beginning one-by-one",
                                   "Remove 1000 elements at the beginning",
                                   "Remove 1000 elements in the middle one-by-one",
                                   "Remove 1000 elements in the middle",
                                   "Remove 1000 elements at the end one-by-one",
                                   "Remove 1000 elements at the end"]
    
    var isTapped = false {
        didSet {
            setTitle()
        }
    }
    
    func setCustomCellLabelText(for index: Int) {
        cellLabel.text? = arrayMenuOptions[index]
    }
    
    private func setTitle() {
        if isTapped {
            cellLabel.text? = ""
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            backgroundColor = .systemGray6
        } else {
            cellLabel.isHidden = false
            activityIndicator.isHidden = true
        }
    }
}
