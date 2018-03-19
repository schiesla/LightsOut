//
//  LightsOutGame.swift
//  LightsOut
//
//  Created by CSSE Department on 3/19/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

import Foundation
import UIKit
class LinearLightsOutGame: CustomStringConvertible {
    
    enum GameState: String {
        case win = "You Win!"
        case notWin = "Keep going!"
    }
    
    var gameState: GameState
    var lightStates: [Bool]
    var moves: Int
    
    init(numLights num: Int) {
        gameState = .notWin
        lightStates = [Bool](repeating: false, count: num)
        moves = 0
        for i in 0...num-1 {
            let randomNumber : Int = Int(arc4random_uniform(UInt32(2)))
            if randomNumber == 1 {
                lightStates[i] = true
            } else {
                lightStates[i] = false
            }
        }
    }
    
    var description: String {
        return "Lights: \(getLightStatusString()) Moves: \(moves)"
    }
    
    func getLightStatusString() -> String {
        var lightStatusString = ""
        for light in lightStates {
            if light == true {
                lightStatusString += "1"
            } else {
                lightStatusString += "0"
            }
        }
        return lightStatusString
    }
    
    func pressedLightAtIndex(_ index: Int) -> Bool {
        if gameState == .win {
            return true
        }
        moves+=1
        switchLight(index)
        if index == 0 {
            switchLight(index+1)
        } else if index == lightStates.count-1 {
            switchLight(index-1)
        } else {
            switchLight(index-1)
            switchLight(index+1)
        }
        return checkForGameOver()
    }
    
    func switchLight(_ index: Int) {
        if lightStates[index] == false {
            lightStates[index] = true
        } else {
            lightStates[index] = false
        }
    }
    
    func checkForGameOver() -> Bool {
        if lightStates.contains(true) {
            gameState = .notWin
            return false
        } else {
            gameState = .win
            return true
        }
    }
    
}
