//
//  ScoreTrakcerService.swift
//  MemoryGame
//
//  Created by Abhishek Kumar on 23/02/22.
//

import Foundation

protocol ScoreTrackerService {
    func updateScore(isValidImage: Bool)
    func getCurrentScore() -> Int
}
