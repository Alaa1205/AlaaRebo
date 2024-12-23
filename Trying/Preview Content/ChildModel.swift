//
//  ChildModel.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 21/06/1446 AH.
//

import Foundation
import SwiftData

@Model
class Child {
    var Age: String
    var currentWordIndex: Int
    var completedWords: [String]
                

    init(Age: String, currentWordIndex: Int, completedWords: [String]) {
        self.Age = Age
        self.currentWordIndex = currentWordIndex
        self.completedWords = completedWords
    
    }
}

