//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private lazy var dictionaryManager = DictionaryManager()
    private lazy var structArrayManager = StructArrayManager()
    private var num = 0 {
        didSet {
            print(num)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(structArrayManager.getArraySize())
        title = "Dictionary: \(Int.random(in: 0...9999))"
        navigationItem.largeTitleDisplayMode = .never
        
        collection.dataSource = self
        collection.delegate = self
        
        activityIndicator.isHidden = false
        
        dictionaryManager.createDictionary {
            self.collection.reloadData()
            self.num += 1
        }
        structArrayManager.createArray {
            self.collection.reloadData()
            self.num += 1
        }
    }
    
    private func creation() {
        
    }
}

extension DictionaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if num == 2 {
            activityIndicator.isHidden = true
            return 6
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CustomCollectionViewCell()
        cell.backgroundColor = .red
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.layer.borderWidth = 0.5
        return cell
    }
}

extension DictionaryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        switch indexPath.row {
        case 0:
            
            break
        default:
            break
        }
    }
}
extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = collectionView.frame.width / 2
        
        return CGSize(width: widthPerItem, height: (collectionView.frame.height) / 6)
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

