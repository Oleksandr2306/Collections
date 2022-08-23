//
//  DictionaryManager.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import Foundation

final class DictionaryManager {
    private var dictionary: Dictionary <String, String> = [:]
    
    func createDictionary(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for element in 0...9_999_999 {
                self.dictionary["Name\(element)"] = "\(element)"
            }
            if self.dictionary.count == 10_000_000 {
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    func getFirst() -> String {
        (dictionary["Name\(0)"])!
    }
    
    func getLast() -> String {
        (dictionary["Name\(dictionary.count-1)"])!
    }
    
    func findElement(phone: String, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for (_, value) in self.dictionary {
                if value == phone {
                    break
                }
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func isEmpty() -> Bool {
        dictionary.isEmpty
    }
    
    func getSize() -> Int {
        dictionary.count
    }
}
