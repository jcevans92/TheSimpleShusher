//
//  RedSegmentedControl.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 4/25/18.
//  Copyright © 2018 Jeremy Evans. All rights reserved.
//

import UIKit

class RedSegmentedControl: UISegmentedControl {
    let redColor = UIColor(displayP3Red: 208/255, green: 72/255, blue: 2/255, alpha: 1.0)
    let greenColor = UIColor(displayP3Red: 111/255, green: 185/255, blue: 25/255, alpha: 1.0)
    
    let choiceItems = ["Dad", "Mom"]
    
    override init(items: [Any]?) {
        super.init(items: choiceItems)
        self.tintColor = redColor
        // Selects the first one always
        self.selectedSegmentIndex = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
