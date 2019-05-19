//
//  QuestionCell.swift
//  Onboarding
//
//  Created by Prudhvi Gadiraju on 4/23/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class QuestionCell: UICollectionViewCell {
    
    var nextQ: (() -> ())!
    
    let question: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 2
        return l
    }()
    
    let nextButton: CustomButton = {
        let b = CustomButton(title: "Next")
        return b
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)

        nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        addSubview(question)
        question.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        question.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    @objc func handleNext() {
        print("Handle")
        nextQ()
    }
}
