//
//  ViewController.swift
//  RocketLaunch
//
//  Created by Oleg Kanatov on 4.08.21.
//

import UIKit

class ViewController: UIViewController {

    var launchButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchButtonSetup()
    }

    func launchButtonSetup() {
        launchButton.setImage(UIImage(named: "powerIcon"), for: .normal)
        launchButton.tintColor = .black
        
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(launchButton)
        
        
        NSLayoutConstraint.activate([
            launchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            launchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchButton.heightAnchor.constraint(equalToConstant: 120),
            launchButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}

