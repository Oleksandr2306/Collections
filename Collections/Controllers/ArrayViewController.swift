//
//  ArrayViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class ArrayViewController: UIViewController {
    
    @IBOutlet weak private var collection: UICollectionView!
    private lazy var arrayManager = IntArrayManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Array: \(Int.random(in: 0...9999))"
        navigationItem.largeTitleDisplayMode = .never
        collection.delegate = self
        collection.dataSource = self
    }
    
}

//MARK: - UICollectionViewDataSource
extension ArrayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayManager.isEmpty() ? 1 : 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CustomCollectionViewCell()
        
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
            cell.layer.borderWidth = 0.5
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionCell", for: indexPath) as! CustomCollectionViewCell
            cell.layer.borderWidth = 0.5
            cell.setArrayCellLabelText(for: indexPath.row)
        }
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension ArrayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        switch indexPath.row {
        case 0:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.createArray {
                    collectionView.reloadData()
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Array creation time: %.3f s.", timer.totalTime)
                }
            }
            break
            
        case 1:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.appendThousandAtTheBeginningOneByOne {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 2:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.appendThousandAtTheBeginningAtOnce {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 3:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.appendThousandInTheMiddleOneByOne {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 4:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.appendThousandInTheMiddleAtOnce {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 5:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.appendThousandAtTheEndOneByOne {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 6:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.appendThousandAtTheEndAtOnce {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 7:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.removeThousandAtTheBeginningOneByOne {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 8:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.removeThousandAtTheBeginningAtOnce {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 9:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.removeThousandInTheMiddleOneByOne {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 10:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.removeThousandInTheMiddleAtOnce {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 11:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.removeThousandAtTheEndOneByOne {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
            
        case 12:
            if !cell.isTapped {
                lazy var timer = CustomTimer()
                cell.isTapped = true
                timer.start()
                arrayManager.removeThousandAtTheEndAtOnce {
                    timer.stop()
                    cell.activityIndicator.isHidden = true
                    cell.cellLabel.text = String(format: "Insertion time: %.3f ms.", timer.totalTime)
                }
            }
            break
        default:
            break
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ArrayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = collectionView.frame.width / 2
        
        if indexPath.item == 0  {
            return CGSize(width: collectionView.frame.width, height: 90)
        } else {
            return CGSize(width: widthPerItem, height: (collectionView.frame.height - 180) / 8)
        }
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


