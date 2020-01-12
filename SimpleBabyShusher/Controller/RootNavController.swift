//
//  RootNavController.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 1/12/20.
//  Copyright © 2020 Jeremy Evans. All rights reserved.
//

import Foundation
import UIKit
import LBTATools

class RootNavController: UINavigationController {

    //(image: UIImage, tintColor: UIColor? = nil, target: Any? = nil, action: Selector? = nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        
        self.setViewControllers([MainViewController()], animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
