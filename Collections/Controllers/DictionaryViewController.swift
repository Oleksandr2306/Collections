//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class DictionaryViewController: UIViewController {
    
    @IBOutlet weak private var collection: UICollectionView!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    private lazy var dictionaryManager = ContactsDictionaryManager()
    private lazy var contactsArrayManager = ContactsArrayManager()
    private var dataSourcesLoaded = 0 {
        didSet {
            collection.reloadData()
        }
    }
    private let numberOfRows: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        activityIndicator.isHidden = false
        
        dictionaryManager.createDictionary {
            self.dataSourcesLoaded += 1
        }
        contactsArrayManager.createArray {
            self.dataSourcesLoaded += 1
        }
    }
}

extension DictionaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard dataSourcesLoaded == 2 else { return 0 }
        activityIndicator.isHidden = true
        return 6
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
        
        if !cell.isTapped {
            lazy var timer = CollectionsOperationTimer()
            switch indexPath.row {
                
            case 0:
                cell.isSelected()
                timer.start()
                DispatchQueue(label: "").async {
                    guard let phone = self.contactsArrayManager.first?.phone else { return }
                    DispatchQueue.main.async {
                        timer.stop()
                        cell.isDeselected()
                        cell.cellLabel.text = String(format: "First element search time: %.3f s. Result number: \(phone)", timer.totalTime)
                    }
                }
                
                break
                
            case 1:
                cell.isSelected()
                timer.start()
                DispatchQueue(label: "").async {
                    guard let phone = self.dictionaryManager.getFirst else { return }
                    DispatchQueue.main.async {
                        timer.stop()
                        cell.isDeselected()
                        cell.cellLabel.text = String(format: "First element search time: %.3f s. Result number: \(phone)", timer.totalTime)
                    }
                }
                break
                
            case 2:
                cell.isSelected()
                timer.start()
                DispatchQueue(label: "").async {
                    guard let phone = self.contactsArrayManager.last?.phone else { return }
                    DispatchQueue.main.async {
                        timer.stop()
                        cell.isDeselected()
                        cell.cellLabel.text = String(format: "First element search time: %.3f s. Result number: \(phone)", timer.totalTime)
                    }
                }
                break
                
            case 3:
                cell.isSelected()
                timer.start()
                DispatchQueue(label: "").async {
                    guard let phone = self.dictionaryManager.getLast else { return }
                    DispatchQueue.main.async {
                        timer.stop()
                        cell.isDeselected()
                        cell.cellLabel.text = String(format: "First element search time: %.3f s. Result number: \(phone)", timer.totalTime)
                    }
                }
                break
                
            case 4:
                cell.isTapped = true
                timer.start()
                contactsArrayManager.findElement {
                    timer.stop()
                    cell.isDeselected()
                    cell.cellLabel.text = String(format: "Non-existing element search time: %.3f s.", timer.totalTime)
                }
                break
                
            case 5:
                cell.isSelected()
                timer.start()
                dictionaryManager.findElement {
                    timer.stop()
                    cell.isDeselected()
                    cell.cellLabel.text = String(format: "Non-existing element search time: %.3f s.", timer.totalTime)
                }
                break
                
            default:
                break
            }
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = collectionView.frame.width / 2
        
        return CGSize(width: widthPerItem, height: (collectionView.frame.height) / numberOfRows)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
}



