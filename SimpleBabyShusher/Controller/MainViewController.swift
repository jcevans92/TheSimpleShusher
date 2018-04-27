//
//  MainViewController.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 4/25/18.
//  Copyright © 2018 Jeremy Evans. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainViewController: UIViewController {
    // Ad Variables
    var interstitial: GADInterstitial!
    
    // Shushing Variables
    var bIsShushing: Bool = false
    var shushSound: String = "Dad"
    
    // Sound Utils used to play shush sounds
    private let soundUtils = SoundUtils()
    
    let viewTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 230, height: 30))
        label.text = "Simple Baby Shusher"
        label.font = UIFont(name: "Helvetica", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 230, height: 30))
        label.text = "Choose a shush tone."
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let soundChoiceControl: RedSegmentedControl = {
        let segmentControl = RedSegmentedControl(items: nil)
        segmentControl.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        // sets sound on change
        segmentControl.addTarget(self, action: #selector(changeSoundItem), for: .valueChanged)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    let shushBtn: ShusherButton = {
        let button = ShusherButton(frame: CGRect(x: 160, y: 100, width: 50, height: 50))
        // Sets touch argument
        button.addTarget(self, action: #selector(shushHasBeenPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil) //if bundle is nil the main bundle will be used
        
        // Add all controls to subview
        self.view.addSubview(viewTitle)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(soundChoiceControl)
        self.view.addSubview(shushBtn)
        
        // Set Button Original Color
        shushBtn.SetButtonColor(bIsShushing: bIsShushing)
 
        // Set Layout
        setLayout()
        
        // Interstitial Ad
        // Live
        //interstitial = GADInterstitial(adUnitID: "ca-app-pub-6241708387402635/7120488183")
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    }

    func setLayout() {
        // Auto Layout
        // Label Layout
        viewTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        viewTitle.widthAnchor.constraint(equalToConstant: 250).isActive = true
        viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Segmented Control
        soundChoiceControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        soundChoiceControl.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 125).isActive = true
        soundChoiceControl.widthAnchor.constraint(equalToConstant: 250).isActive = true
        soundChoiceControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Description Text
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: soundChoiceControl.topAnchor, constant: 0).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Button Layout
        shushBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        shushBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
        shushBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        shushBtn.heightAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ***** Selectors below here *****
    
    // This function is to start and stop the shushing sound
    // It is connected to the Shush button
    @objc func shushHasBeenPressed(sender: UIButton!) {
        if(bIsShushing) {
            bIsShushing = false
            shushBtn.SetButtonColor(bIsShushing: false)
            shushBtn.layer.removeAllAnimations()
            // Kill Shush Sound
            soundUtils.StopShushSounds()
        } else {
            bIsShushing = true
            shushBtn.SetButtonColor(bIsShushing: true)
            shushBtn.pulsate()
            if self.shushSound == "Dad" {
                soundUtils.PlayMaleShush()
            }
        }
        
        let request = GADRequest()
        // For child ad content
        request.tag(forChildDirectedTreatment: true)
        interstitial.load(request)
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    @objc func changeSoundItem(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.shushSound = "Dad"
        case 1:
            self.shushSound = "Mom"
        default:
            self.shushSound = "Dad"
        }
    }


}
