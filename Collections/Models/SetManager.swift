//
//  SetManager.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 21.08.2022.
//

import Foundation

final class SetManager {
    
    func allMatchingCharacters(for first: String, and second: String) -> Set<String.Element> {
        let input = Set(first)
        let exclusions = Set(second)
        var result = Set<String.Element>()
        
        result = input.intersection(exclusions)
        return result
    }
     
    func allNotMatchingCharacters(for first: String, and second: String) -> Set<String.Element> {
        let input = Set(first)
        let exclusions = Set(second)
        var result = Set<String.Element>()
        
        let notMatchingCharactersWithExclusions = input.filter{ !exclusions.contains($0) }
        let notMatchingCharactersWithInput = exclusions.filter{ !input.contains($0) }
        
        result = result.union(notMatchingCharactersWithExclusions).union(notMatchingCharactersWithInput)
        return result
    }
    
    func allUniqueCharacters(from first: String, butNotFrom second: String) -> Set<String.Element> {
        let input = Set(first)
        let exclusions = Set(second)
        var result = Set<String.Element>()
        
        result = input.filter{ !exclusions.contains($0) }
        return result
    }
    
}

