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
    
    var game = LinearLightsOutGame(numLights: 13)
    
    @IBAction func pressedNewGame(_ sender: Any) {
        print("new game")
        game = LinearLightsOutGame(numLights: 13)
        gameStateLabel.text = String(game.moves)
        gameStateNavBar.topItem?.title = String(game.moves)
        updateView(game.checkForGameOver())
    }
    
    @IBAction func pressedGameButton(_ sender: Any) {
        if (game.gameState == .win) {
            return
        } else {
            let gameBoardButton = sender as! UIButton
            print(gameBoardButton.tag);
            updateView(game.pressedLightAtIndex(gameBoardButton.tag))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateLabel.text = String(game.moves)
        gameStateNavBar.topItem?.title = String(game.moves)
        updateView(game.checkForGameOver())
    }

    func updateView(_ gameState: Bool) {
        let onImage = #imageLiteral(resourceName: "light_on")
        let offImage = #imageLiteral(resourceName: "light_off")
        print(game.lightStates)
        for i in 0..<game.lightStates.count {
            var button: UIButton
            button = gameButtons[i]
            switch(game.lightStates[i]) {
            case true:
                button.setImage(onImage, for: UIControlState.normal)
            case false:
                button.setImage(offImage, for: UIControlState.normal)
            }
        }
        if (game.gameState == .win) {
            gameStateLabel.text = "You Win"
            gameStateNavBar.topItem?.title = "You Win"
        } else {
            gameStateLabel.text = String(game.moves)
            gameStateNavBar.topItem?.title = String(game.moves)
        }
    }


}

