//
//  CustomButton.swift
//  Onboarding
//
//  Created by Prudhvi Gadiraju on 4/23/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        contentEdgeInsets = .init(top: 10, left: 20, bottom: 10, right: 20)
        backgroundColor = #colorLiteral(red: 0.2, green: 0.4, blue: 1, alpha: 1)
        layer.cornerRadius = 12
        showsTouchWhenHighlighted = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
