//
//  ViewController.swift
//  LightsOut
//
//  Created by CSSE Department on 3/19/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet var gameButtons: [UIButton]!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    var game = LightsOutObjC()
    
    @IBAction func pressedNewGame(_ sender: Any) {
        print("new game")
        game = LightsOutObjC(numLights: 13)
        gameStateLabel.text = String(game.movesTaken)
        gameStateNavBar.topItem?.title = String(game.movesTaken)
        updateView(game.checkForWin())
    }
    
    @IBAction func pressedGameButton(_ sender: Any) {
        if (game.gameState.rawValue == 0) {
            return
        } else {
            let gameBoardButton = sender as! UIButton
            print(gameBoardButton.tag);
            updateView(game.pressedLight(at: gameBoardButton.tag))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = LightsOutObjC(numLights: 13)
        gameStateLabel.text = String(game.movesTaken)
        gameStateNavBar.topItem?.title = String(game.movesTaken)
        updateView(game.checkForWin())
    }

    func updateView(_ gameState: Bool) {
        let onImage = #imageLiteral(resourceName: "light_on")
        let offImage = #imageLiteral(resourceName: "light_off")
        for i in 0..<game.numLights {
            var button: UIButton
            button = gameButtons[i]
            switch(game.lightStateString(i)) {
            case "T":
                button.setImage(onImage, for: UIControlState.normal)
            case "F":
                button.setImage(offImage, for: UIControlState.normal)
            case .none:
                button = gameButtons[i]
            case .some(_):
                button = gameButtons[i]
            }
        }
        if (game.gameState.rawValue == 0) {
            gameStateLabel.text = "You Win, Moves: " + String(game.movesTaken)
            gameStateNavBar.topItem?.title = "You Win, Moves: " + String(game.movesTaken)
        } else {
            gameStateLabel.text = "Moves: " + String(game.movesTaken)
            gameStateNavBar.topItem?.title = "Moves: " + String(game.movesTaken)
        }
    }


}

