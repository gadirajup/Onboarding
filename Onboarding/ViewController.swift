//
//  ViewController.swift
//  Onboarding
//
//  Created by Prudhvi Gadiraju on 4/23/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OnBoardingFinished {
    
    func done() {
        print("done")

    }
    
    
    let startButton: CustomButton = {
        let b = CustomButton(title: "Start")
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(startButton)
        startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
    }

    @objc fileprivate func handleStart() {
        let oc = Onboarding()
        present(oc, animated: true, completion: nil)
    }

}

