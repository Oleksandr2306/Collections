//
//  ArrayViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class ArrayViewController: UICollectionViewController {
    
    private lazy var arrayManager = IntArrayManager()
    private let firstCellHeight = 90
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayManager.isEmptyArray ? 1 : 13
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CustomCollectionViewCell()
        
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionCell", for: indexPath) as! CustomCollectionViewCell
            cell.setCustomCellLabelText(for: indexPath.row - 1)
        }
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        if !cell.isTapped {
            switch indexPath.row {
            case 0:
                arrayOperation(cell: cell, operation: arrayManager.createArray(completion:))
                break
                
            case 1:
                arrayOperation(cell: cell, operation: arrayManager.appendThousandAtTheBeginningOneByOne(completion:))
                break
                
            case 2:
                arrayOperation(cell: cell, operation: arrayManager.appendThousandAtTheBeginningAtOnce(completion:))
                break
                
            case 3:
                arrayOperation(cell: cell, operation: arrayManager.appendThousandInTheMiddleOneByOne(completion:))
                break
                
            case 4:
                arrayOperation(cell: cell, operation: arrayManager.appendThousandInTheMiddleAtOnce(completion:))
                break
                
            case 5:
                arrayOperation(cell: cell, operation: arrayManager.appendThousandAtTheEndOneByOne(completion:))
                break
                
            case 6:
                arrayOperation(cell: cell, operation: arrayManager.appendThousandAtTheEndAtOnce(completion:))
                break
                
            case 7:
                arrayOperation(cell: cell, operation: arrayManager.removeThousandAtTheBeginningOneByOne(completion:))
                break
                
            case 8:
                arrayOperation(cell: cell, operation: arrayManager.removeThousandAtTheBeginningAtOnce(completion:))
                break
                
            case 9:
                arrayOperation(cell: cell, operation: arrayManager.removeThousandInTheMiddleOneByOne(completion:))
                break
                
            case 10:
                arrayOperation(cell: cell, operation: arrayManager.removeThousandInTheMiddleAtOnce(completion:))
                break
                
            case 11:
                arrayOperation(cell: cell, operation: arrayManager.removeThousandAtTheEndOneByOne(completion:))
                break
                
            case 12:
                arrayOperation(cell: cell, operation: arrayManager.removeThousandAtTheEndAtOnce(completion:))
                break
                
            default:
                break
            }
        }
    }
    
    private func arrayOperation(cell: CustomCollectionViewCell, operation: (@escaping () -> Void) -> Void) {
        lazy var timer = CollectionsOperationTimer()
        cell.isTapped = true
        timer.start()
        operation {
            if self.collectionView.numberOfItems(inSection: 0) == 1 {
                self.collectionView.reloadData()
            }
            timer.stop()
            cell.activityIndicator.isHidden = true
            cell.cellLabel.text = String(format: "Execution time: %.3f s.", timer.totalTime)
        }
    }
    
}

extension ArrayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = collectionView.frame.width / 2
        
        if indexPath.item == 0  {
            return CGSize(width: collectionView.frame.width, height: CGFloat(firstCellHeight))
        } else {
            return CGSize(width: widthPerItem, height: (collectionView.frame.height))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(0)
    }
}
