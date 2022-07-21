//
//  GridCollectionViewCell.swift
//  MemoryGame

//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func setupUI()  {
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 8.0
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        label.text = ""
    }
    
    func flipCard(with value: String) {
        label.text = value
    }
    
    func hide()  {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { [weak self] in
            self?.label.text = ""
        }
    }
}
