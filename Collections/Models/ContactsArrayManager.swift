//
//  StructArrayManager.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import Foundation

final class ContactsArrayManager {
    private var array = [Contact]()
    private let dictionaryOperationsQueue = DispatchQueue(label: "dictionary")
    var isEmptyArray: Bool {
        array.isEmpty
    }
    var arraySize: Int {
        array.count
    }
    var first: Contact? {
        array.first
    }
    var last: Contact? {
        array.last
    }
    
    func createArray(completion: @escaping () -> Void) {
        dictionaryOperationsQueue.async {
            for element in 0...9_999_999 {
                self.array.append(Contact(name: "Name\(element)", phone: "\(element)"))
            }
            if self.array.count == 10_000_000 {
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    func findElement(completion: @escaping () -> Void) {
        dictionaryOperationsQueue.async {
            guard self.array.first(where: { $0.phone == "\(self.arraySize + 1)" }) == nil else { return }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}


