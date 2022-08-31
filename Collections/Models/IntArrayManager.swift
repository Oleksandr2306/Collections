//
//  IntArrayManager.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 19.08.2022.
//

import Foundation

final class IntArrayManager {
    private var array = [Int]()
    
    func createArray(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for element in 0...9_999_999 {
                self.array.append(element)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func appendThousandAtTheBeginningOneByOne(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for element in 0...999 {
                self.array.insert(element, at: self.array.startIndex)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func appendThousandAtTheBeginningAtOnce(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.array.insert(contentsOf: Array(0...999), at: self.array.startIndex)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func appendThousandInTheMiddleOneByOne(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for element in 0...999 {
                self.array.insert(element, at: self.array.count / 2)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func appendThousandInTheMiddleAtOnce(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.array.insert(contentsOf: Array(0...999), at: self.array.count / 2)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func appendThousandAtTheEndOneByOne(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for element in 0...999 {
                self.array.append(element)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func appendThousandAtTheEndAtOnce(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.array.append(contentsOf: Array(0...999))
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeThousandAtTheBeginningOneByOne(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for _ in 0...999 {
                self.array.removeFirst()
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeThousandAtTheBeginningAtOnce(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.array.removeFirst(1000)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeThousandInTheMiddleOneByOne(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for _ in 0...999 {
                self.array.remove(at: self.array.count / 2)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeThousandInTheMiddleAtOnce(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.array.removeSubrange(self.array.count / 2...(self.array.count / 2) + 999 )
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeThousandAtTheEndOneByOne(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            for _ in 0...999 {
                self.array.removeLast()
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeThousandAtTheEndAtOnce(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.array.removeLast(1000)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func isEmpty() -> Bool {
        array.isEmpty
    }
    
    func getSize() -> Int {
        array.count
    }
    
}
