//
//  ViewController.swift
//  MemoryGame
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var firstCardIndexPath: IndexPath?
    
    
     var animalData: [GameEmoji] = [GameEmoji(name: "🐢"),
                                   GameEmoji(name: "🦀"),
                                   GameEmoji(name: "🐬"),
                                   GameEmoji(name: "🦀"),
                                   GameEmoji(name: "🦞"),
                                   GameEmoji(name: "🐬"),
                                   GameEmoji(name: "🐢"),
                                   GameEmoji(name: "🦞")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setupCollectionView()
    }
}

extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as? GridCollectionViewCell else {
            fatalError("dequeue is failing")
        }
        cell.setupUI()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? GridCollectionViewCell else {
            return
        }
        if !animalData[indexPath.item].isFlipped && !animalData[indexPath.item].isMatched {
            cell.flipCard(with: animalData[indexPath.item].name)
            animalData[indexPath.item].isFlipped = true
            if firstCardIndexPath == nil {
                firstCardIndexPath = indexPath
            } else {
                checkForMatchForOnSecondMove(indexPath)
            }
        }
        if animalData.filter({$0.isMatched == true}).count == animalData.count {
            showAlert()
        }
    }
    
    func checkForMatchForOnSecondMove(_ secondIndexPath: IndexPath) {
        let firstcell = collectionView.cellForItem(at: firstCardIndexPath!) as? GridCollectionViewCell
        let secondCell = collectionView.cellForItem(at: secondIndexPath) as? GridCollectionViewCell
        
        if animalData[firstCardIndexPath!.item].name == animalData[secondIndexPath.item].name {
            secondCell?.flipCard(with: animalData[secondIndexPath.item].name)
            animalData[firstCardIndexPath!.item].isMatched = true
            animalData[secondIndexPath.item].isMatched = true
            animalData[secondIndexPath.item].isFlipped = true
        } else {
            animalData[secondIndexPath.item].isFlipped = false
            animalData[firstCardIndexPath!.item].isFlipped = false
            secondCell?.flipCard(with: animalData[secondIndexPath.item].name)
            firstcell?.hide()
            secondCell?.hide()
        }
        firstCardIndexPath = nil
    }
    
    func showAlert() {
        let action = UIAlertAction(title: "Dismiss", style: .default) { [weak self] _ in
            self?.animalData.forEach { $0.reset() }
            self?.collectionView.reloadData()
        }
        
       let alert = UIAlertController(title: "Winner", message: "You win the match", preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

