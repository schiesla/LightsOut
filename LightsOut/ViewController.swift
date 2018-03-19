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
        updateView(game.checkForGameOver())
    }
    
    @IBAction func pressedGameButton(_ sender: Any) {
        let gameBoardButton = sender as! UIButton
        print(gameBoardButton.tag);
        updateView(game.pressedLightAtIndex(gameBoardButton.tag))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(game.checkForGameOver())
    }

    func updateView(_ gameState: Bool) {
        let onImage = #imageLiteral(resourceName: "light_on")
        let offImage = #imageLiteral(resourceName: "light_off")
        
        for i in 0..<game.lightStates.count {
            var button: UIButton
            if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
                button = gameButtons[i]
            } else {
                button = gameButtons[i + 13]
            }
            switch(game.lightStates[i]) {
            case true:
                button.setImage(onImage, for: UIControlState.normal)
            case false:
                button.setImage(offImage, for: UIControlState.normal)
            }
        }
    }


}

