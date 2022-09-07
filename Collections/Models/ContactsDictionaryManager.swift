//
//  DictionaryManager.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import Foundation

final class ContactsDictionaryManager {
    private var dictionary: Dictionary <String, String> = [:]
    private let dictionaryOperationsQueue = DispatchQueue(label: "dictionary")
    var isEmptyDictionary: Bool {
        dictionary.isEmpty
    }
    var dictionarySize: Int {
        dictionary.count
    }
    var getFirst: String? {
        dictionary["Name\(0)"]
    }
    var getLast: String? {
        dictionary["Name\(dictionary.count-1)"]
    }
    
    func createDictionary(completion: @escaping () -> Void) {
        dictionaryOperationsQueue.async {
            for element in 0...9_999_999 {
                let contact = Contact(name: "Name\(element)", phone: "\(element)")
                self.dictionary[contact.name] = "\(contact.phone)"
            }
            DispatchQueue.main.async {
                completion()
            }
        }
            
    }
    
    func findElement(completion: @escaping () -> Void) {
        dictionaryOperationsQueue.async {
            guard self.dictionary["Name\(self.dictionary.count)"] == nil else { return }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}


