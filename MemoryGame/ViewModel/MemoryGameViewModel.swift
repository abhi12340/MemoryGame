//
//  MemoryGameViewModel.swift
//  MemoryGame
//
//  Created by Abhishek Kumar on 03/04/22.
//

import Foundation


protocol ViewModelDelegate: AnyObject {
    func flipCell(for indexPath: IndexPath)
}

class ViewModel {
    
    
    weak var delegate: ViewModelDelegate?
    var datasource: [GameEmoji] = [GameEmoji(name: "🐢"),
                                   GameEmoji(name: "🦀"),
                                   GameEmoji(name: "🐬"),
                                   GameEmoji(name: "🦀"),
                                   GameEmoji(name: "🦞"),
                                   GameEmoji(name: "🐬"),
                                   GameEmoji(name: "🐢"),
                                   GameEmoji(name: "🦞")]
    
    var firstSeletedIndexPath: IndexPath?
    
    func gridTapped(with indexpath: IndexPath) {
        if !datasource[indexpath.item].isFlipped && !datasource[indexpath.item].isMatched {
            delegate?.flipCell(for: indexpath)
            datasource[indexpath.item].isFlipped = true
            if firstSeletedIndexPath == nil {
                firstSeletedIndexPath = indexpath
            } else {
                
            }
        }
    }
    
}
