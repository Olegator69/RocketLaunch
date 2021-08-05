//
//  ViewController.swift
//  RocketLaunch
//
//  Created by Oleg Kanatov on 4.08.21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var launchButton = UIButton(type: .system)
    var backgroundView = UIView()
    var rocketImage = UIImageView()
    var cloudImage = UIImageView()
    var textLabel = UILabel()
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchButtonSetup()
        backgroundViewSetup()
        rocketImageSetup()
        cloudImageSetup()
        textLabelSetup()
    }

    func launchButtonSetup() {
        launchButton.setImage(UIImage(named: "powerIcon"), for: .normal)
        launchButton.tintColor = .black
        launchButton.addTarget(self, action: #selector(buttomTapped), for: .touchUpInside)
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(launchButton)
        
        NSLayoutConstraint.activate([
            launchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            launchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchButton.heightAnchor.constraint(equalToConstant: 120),
            launchButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    @objc func buttomTapped(_ sender: Any) {
        backgroundView.isHidden = false
        audioSetup()
        textLabel.isHidden = true
        let frame = rocketImage.frame
        rocketImage.frame.origin.y = 700
        UIView.animate(withDuration: 3.5) {
            self.rocketImage.frame = frame
        } completion: { _ in
            self.textLabel.isHidden = false
        }
    }
    
    func backgroundViewSetup() {
        backgroundView.isHidden = true
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func rocketImageSetup() {
        rocketImage.image = UIImage(named: "rocket")
        rocketImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(rocketImage)
        
        NSLayoutConstraint.activate([
            rocketImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 70),
            rocketImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            rocketImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            rocketImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor)
        ])
    }
    
    func cloudImageSetup() {
        cloudImage.image = UIImage(named: "clouds")
        cloudImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(cloudImage)
        
        NSLayoutConstraint.activate([
            cloudImage.heightAnchor.constraint(equalToConstant: 300),
            cloudImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            cloudImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            cloudImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor)
        ])
    }
    
    func textLabelSetup() {
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.text = "Успешный запуск!"
        textLabel.font = UIFont.systemFont(ofSize: 40)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -80),
            textLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
    }
    
    func audioSetup() {
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try? AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
        player.play()
    }
    
}

