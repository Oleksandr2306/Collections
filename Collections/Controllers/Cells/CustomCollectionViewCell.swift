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
    
    private let arrayMenuOptions = ["Insert 1000 elements at the beginning of the array one-by-one",
                                    "Insert 1000 elements at the beginning of the array",
                                    "Insert 1000 elements in the middle of the array one-by-one",
                                    "Insert 1000 elements in the middle of the array",
                                    "Insert 1000 elements at the end of the array one-by-one",
                                    "Insert 1000 elements at the end of the array all at once",
                                    "Remove 1000 elements at the beginning of the array one-by-one",
                                    "Remove 1000 elements at the beginning of the array",
                                    "Remove 1000 elements in the middle of the array one-by-one",
                                    "Remove 1000 elements in the middle of the array",
                                    "Remove 1000 elements at the end of the array one-by-one",
                                    "Remove 1000 elements at the end of the array"]
    
    private let dictionaryMenuOptions = ["Find the first element",
                                         "Find the last element",
                                         "Search for a non-existing element"]
    
    var isTapped = false {
        didSet {
            if isTapped {
                cellLabel.text = ""
                activityIndicator.isHidden = false
                backgroundColor = .systemGray6
            } else {
                cellLabel.isHidden = false
                activityIndicator.isHidden = true
            }
        }
    }
    
    func setArrayCellLabelText(for index: Int) {
        cellLabel.text = arrayMenuOptions[index-1]
    }
    
    func setDictionaryCellLabelText(for index: Int) {
        cellLabel.text = dictionaryMenuOptions[index]
    }
}
