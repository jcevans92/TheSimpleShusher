//
//  ShusherButton.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 4/25/18.
//  Copyright © 2018 Jeremy Evans. All rights reserved.
//

import UIKit

class ShusherButton: UIButton {

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
            self.layer.borderColor = UIColor(displayP3Red: 208/255, green: 72/255, blue: 2/255, alpha: 1.0).cgColor
            self.tintColor = UIColor(displayP3Red: 126/255, green: 211/255, blue: 33/255, alpha: 1.0)
            self.SetTitle(szTitle: "Stop Shushing")
        } else {
            // Set button to red
            self.layer.borderColor = UIColor(displayP3Red: 208/255, green: 72/255, blue: 2/255, alpha: 1.0).cgColor
            self.tintColor = UIColor(displayP3Red: 208/255, green: 72/255, blue: 2/255, alpha: 1.0)
            self.SetTitle(szTitle: "Shush")
        }
    }
    
}
