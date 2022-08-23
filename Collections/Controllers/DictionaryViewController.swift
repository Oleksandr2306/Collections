//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private lazy var dictionaryManager = DictionaryManager()
    private lazy var structArrayManager = StructArrayManager()
    private var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(structArrayManager.getSize())
        title = "Dictionary: \(Int.random(in: 0...9999))"
        navigationItem.largeTitleDisplayMode = .never
        
        collection.dataSource = self
        collection.delegate = self
        
        activityIndicator.isHidden = false
        
        dictionaryManager.createDictionary {
            self.collection.reloadData()
            self.flag += 1
        }
        structArrayManager.createArray {
            self.collection.reloadData()
            self.flag += 1
        }
    }
    
    private func creation() {
        
    }
}

extension DictionaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if flag == 2 {
            activityIndicator.isHidden = true
            return 6
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CustomCollectionViewCell()
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.layer.borderWidth = 0.5
        
        switch indexPath.row {
        case 0, 1:
            cell.setDictionaryCellLabelText(for: 0)
            break
        case 2, 3:
            cell.setDictionaryCellLabelText(for: 1)
            break
        case 4, 5:
            cell.setDictionaryCellLabelText(for: 2)
            break
        default:
            break
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension DictionaryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        
        switch indexPath.row {
        case 0:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                cell.activityIndicator.isHidden = true
                timer.stop()
                cell.cellLabel.text = String(format: "First element search time: %.3f s. Result number: \(structArrayManager.getFirst().phone)", timer.totalTime)
            }
            break
            
        case 1:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                cell.activityIndicator.isHidden = true
                timer.stop()
                cell.cellLabel.text = String(format: "First element search time: %.3f s. Result number: \(dictionaryManager.getFirst())", timer.totalTime)
            }
            break
            
        case 2:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                cell.activityIndicator.isHidden = true
                timer.stop()
                cell.cellLabel.text = String(format: "Last element search time: %.3f s. Result number: \(structArrayManager.getLast().phone)", timer.totalTime)
            }
            break
            
        case 3:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                cell.activityIndicator.isHidden = true
                timer.stop()
                cell.cellLabel.text = String(format: "Last element search time: %.3f s. Result number: \(dictionaryManager.getLast())", timer.totalTime)
            }
            break
            
        case 4:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                structArrayManager.findElement(phone: "1010101010101010") {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Non-existing element search time: %.3f s.", timer.totalTime)
                }
            }
            break
            
        case 5:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                dictionaryManager.findElement(phone: "1010101010101010") {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Non-existing element search time: %.3f s.", timer.totalTime)
                }
            }
            break
            
        default:
            break
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = collectionView.frame.width / 2
        
        return CGSize(width: widthPerItem, height: (collectionView.frame.height) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0).left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0).right
    }
}

