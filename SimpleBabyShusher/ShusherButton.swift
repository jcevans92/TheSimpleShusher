//
//  ShusherButton.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 4/25/18.
//  Copyright © 2018 Jeremy Evans. All rights reserved.
//

import UIKit

class ShusherButton: UIButton {
    let redColor = UIColor(displayP3Red: 208/255, green: 72/255, blue: 2/255, alpha: 1.0)
    let greenColor = UIColor(displayP3Red: 111/255, green: 185/255, blue: 25/255, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //let frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetTitle(szTitle: String) {
        self.setTitle(szTitle, for: .normal)
    }
    
    func SetButtonColor(bIsShushing: Bool) {
        if (bIsShushing) {
            // Set button to green
            self.layer.borderColor = redColor.cgColor
            self.SetTitle(szTitle: "Stop Shushing")
            self.setTitleColor(redColor, for: .normal)
        } else {
            
            // Set button to red
            self.layer.borderColor = greenColor.cgColor
            self.SetTitle(szTitle: "Start Shushing")
            self.setTitleColor(greenColor, for: .normal)
        }
        
        // These will be the same no matter what
        // Set Title Font
        self.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        // Set Border
        self.layer.borderWidth = 3.0
    }
    
}
