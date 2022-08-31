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
    
    private enum arrayMenuOptions: String, CaseIterable {
        case option1 = "Insert 1000 elements at the beginning of the array one-by-one"
        case option2 = "Insert 1000 elements at the beginning of the array"
        case option3 = "Insert 1000 elements in the middle of the array one-by-one"
        case option4 = "Insert 1000 elements in the middle of the array"
        case option5 = "Insert 1000 elements at the end of the array one-by-one"
        case option6 = "Insert 1000 elements at the end of the array all at once"
        case option7 = "Remove 1000 elements at the beginning of the array one-by-one"
        case option8 = "Remove 1000 elements at the beginning of the array"
        case option9 = "Remove 1000 elements in the middle of the array one-by-one"
        case option10 = "Remove 1000 elements in the middle of the array"
        case option11 = "Remove 1000 elements at the end of the array one-by-one"
        case option12 = "Remove 1000 elements at the end of the array"
    }
    
    var isTapped = false {
        didSet {
            if isTapped {
                cellLabel.text? = ""
                activityIndicator.isHidden = false
                backgroundColor = .systemGray6
            } else {
                cellLabel.isHidden = false
                activityIndicator.isHidden = true
            }
        }
    }
    
    func setCustomCellLabelText(for index: Int) {
        cellLabel.text? = arrayMenuOptions.allCases[index].rawValue
    }
}
