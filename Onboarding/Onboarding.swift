//
//  Onboarding.swift
//  Onboarding
//
//  Created by Prudhvi Gadiraju on 4/23/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

protocol OnBoardingFinished {
    func done()
}

class Onboarding: UICollectionViewController {
    
    var questions = ["1", "2", "3"]
    var delegate: OnBoardingFinished?
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}

extension Onboarding: UICollectionViewDelegateFlowLayout {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuestionCell
        cell.question.text = questions[indexPath.item]
        
        if indexPath.item < self.questions.count - 1 {
            cell.nextQ = { [unowned self] in
                self.collectionView.scrollToItem(at: IndexPath(item: indexPath.item+1, section: 0), at: .centeredHorizontally, animated: true)
            }
        } else {
            cell.nextButton.setTitle("Finish", for: .normal)
            cell.nextQ = { [unowned self] in
                let finish = Finish()
                finish.view.backgroundColor = .yellow
                self.present(finish, animated: true, completion: nil)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}
