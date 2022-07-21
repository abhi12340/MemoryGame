//
//  ImageValidatorService.swift
//  MemoryGame
//
//  Created by Abhishek Kumar on 23/02/22.
//

import Foundation

protocol ImageValidatorService {
    func validateImage(at currentPos: Int) -> Bool
    func setImages(for list: [GameEmoji])
    func getCurrentList() -> [GameEmoji]
}
