//
//  SoundUtlities.swift
//  SimpleBabyShusher
//
//  Created by Jeremy Evans on 4/25/18.
//  Copyright © 2018 Jeremy Evans. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SoundUtils: NSObject {
    var shushPlayer: AVAudioPlayer? = nil

    public func PlayMaleShush() {
        do {
            let maleShushPath = Bundle.main.path(forResource: "MaleShush.mp3", ofType:nil)!
            let maleShushurl = URL(fileURLWithPath: maleShushPath)
            self.shushPlayer = try AVAudioPlayer(contentsOf: maleShushurl)
            self.shushPlayer?.numberOfLoops = -1
            self.shushPlayer?.play()
        } catch {
            // Throw exception
            print("File not found or could not be loaded.")
        }
    }
    
    public func PlayFemaleShush() {
        do {
            let femaleShushPath = Bundle.main.path(forResource: "FemaleShush.mp3", ofType:nil)!
            let femaleShushurl = URL(fileURLWithPath: femaleShushPath)
            self.shushPlayer = try AVAudioPlayer(contentsOf: femaleShushurl)
            self.shushPlayer?.play()
        } catch {
            // Throw exception
            print("File not found or could not be loaded.")
        }
    }
    
    public func StopShushSounds() {
        if let bPlaying = self.shushPlayer?.isPlaying {
            if bPlaying {
                self.shushPlayer?.stop()
                self.shushPlayer = nil
            }
        }
    }
}
