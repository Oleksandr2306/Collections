//
//  StructArrayManager.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import Foundation

final class StructArrayManager {
    private var array = [Contact]()
    
    func createArray(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for element in 0...9_999_999 {
                self.array.append(Contact(name: "Name\(element)", phone: "\(element)"))
            }
            if self.array.count == 10_000_000 {
                print("YES")
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    func getFirst() -> Contact {
        array[0]
    }
    
    func getLast() -> Contact {
        array[array.endIndex]
    }
    
    func findElement(phone: String) -> Bool {
        for element in array {
            if element.phone == phone {
                return true
            }
        }
        return false
    }
    
    func arrayIsEmpty() -> Bool {
        return array.isEmpty
    }
    
    func getArraySize() -> Int {
        array.count
    }
}
