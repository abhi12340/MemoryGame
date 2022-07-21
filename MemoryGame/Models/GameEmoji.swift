//
//  GameEmoji.swift
//  MemoryGame
//
//  Created by Abhishek Kumar on 23/02/22.
//

import Foundation

class GameEmoji {
    var name: String = ""
    var isFlipped = false
    var isMatched = false
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        isMatched = false
        isFlipped = false
    }
}
