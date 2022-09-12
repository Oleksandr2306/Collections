//
//  SetViewController.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 18.08.2022.
//

import UIKit

final class SetViewController: UIViewController {
    
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var additionalTextField: UITextField!
    @IBOutlet private weak var allMatchesLabel: UILabel!
    @IBOutlet private weak var allNotMatchesLabel: UILabel!
    @IBOutlet private weak var allUniqueCharactersLabel: UILabel!
    
    lazy private var setManager = SetManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        additionalTextField.delegate = self
    }
    
    @IBAction private func allMatchesButtonTapped(_ sender: UIButton) {
        guard let text1 = inputTextField.text else { return }
        guard let text2 = additionalTextField.text else { return }
        
        let result = setManager.characters(in: text1, matching: text2)
        allMatchesLabel.text = String(result)
    }
    
    @IBAction private func allNotMatchesButtonTapped(_ sender: UIButton) {
        guard let text1 = inputTextField.text else { return }
        guard let text2 = additionalTextField.text else { return }
        
        let result = setManager.notMatchingCharacters(in: text1, and: text2)
        allNotMatchesLabel.text = String(result)
    }
    
    @IBAction private func allUniqueCharactersButtonTapped(_ sender: UIButton) {
        guard let text1 = inputTextField.text else { return }
        guard let text2 = additionalTextField.text else { return }
        
        let result = setManager.uniqueCharacters(from: text1, excluding: text2)
        allUniqueCharactersLabel.text = String(result)
    }
    
    @IBAction private func textFieldsEditing(_ sender: UITextField) {
        sender.text = sender.text?.filter{ $0.isLetter }
    }
    
}

//MARK: - UITextFieldDelegate
extension SetViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

