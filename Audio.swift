//
//  Audio.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 4/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import AudioToolbox

extension PassController {
    
    var soundEffectName: String {
        if testResultsView.backgroundColor == UIColor.green {
            return "AccessGranted"
        } else  {
            return "AccessDenied"
        }
    }
    
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
    }
}


class Buzzer {
    var sound: SystemSoundID = 0
    
    func playSound(for view: PassController) {
        let soundURL = view.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        AudioServicesPlaySystemSound(sound)
    }
}











































