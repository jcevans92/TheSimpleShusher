//
//  AppStoreReviewManager.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 1/5/20.
//  Copyright © 2020 Jeremy Evans. All rights reserved.
//

import StoreKit

enum AppStoreReviewManager {
    
    static let minimumReviewWorthyActionCount = 3
    
  static func requestReviewIfAppropriate() {
    let defaults = UserDefaults.standard
    let bundle = Bundle.main

    // 2.
    var actionCount = defaults.integer(forKey: "reviewworthyactioncount")

    // 3.
    actionCount += 1

    // 4.
    defaults.set(actionCount, forKey: "reviewworthyactioncount")

    // 5.
    guard actionCount >= minimumReviewWorthyActionCount else {
      return
    }

    // 6.
    let bundleVersionKey = kCFBundleVersionKey as String
    let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
    let lastVersion = defaults.string(forKey: "lastreviewworthyactioncount")

    // 7.
    guard lastVersion == nil || lastVersion != currentVersion else {
      return
    }

    // 8.
    SKStoreReviewController.requestReview()

    // 9.
    defaults.set(0, forKey: "reviewworthyactioncount")
    defaults.set(currentVersion, forKey: "lastreviewworthyactioncount")
  }
}
