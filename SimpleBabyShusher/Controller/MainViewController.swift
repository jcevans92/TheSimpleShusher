//
//  MainViewController.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 4/25/18.
//  Copyright © 2018 Jeremy Evans. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var bIsShushing: Bool = false
    
    let viewTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 230, height: 30))
        label.text = "Simple Baby Shusher"
        label.font = UIFont(name: "Helvetica", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shushBtn: ShusherButton = {
        let button = ShusherButton(frame: CGRect(x: 160, y: 100, width: 50, height: 50))
        // Sets touch argument
        button.addTarget(self, action: #selector(shushHasBeenPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    /*let shushBtn: UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 160, height: 50))

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil) //if bundle is nil the main bundle will be used
        
        // Add all controls to subview
        self.view.addSubview(viewTitle)
        self.view.addSubview(shushBtn)
        shushBtn.SetButtonColor(bIsShushing: bIsShushing)
        
        // Set Layout
        setLayout()
        
        // Set Button Color

    }

    func setLayout() {
        // Auto Layout
        // Label Layout
        viewTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        viewTitle.widthAnchor.constraint(equalToConstant: 250).isActive = true//.constraint(lessThanOrEqualToConstant: 230).isActive = true//.constraint(equalToConstant: 230).isActive = true
        viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Button Layout
        //LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shushBtn.center.x = self.view.center.x
        shushBtn.center.y = self.view.center.y
        shushBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        shushBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        shushBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        shushBtn.heightAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
    // This function is to start and stop the shushing sound
    // It is connected to the Shush button
    @objc func shushHasBeenPressed(sender: UIButton!) {
        if(bIsShushing) {
            bIsShushing = false
            shushBtn.SetButtonColor(bIsShushing: false)
            shushBtn.layer.removeAllAnimations()
        } else {
            bIsShushing = true
            shushBtn.SetButtonColor(bIsShushing: true)
            shushBtn.pulsate()
        }
    }
    
    func generateAnimation() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
