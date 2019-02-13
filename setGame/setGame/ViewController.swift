//
//  ViewController.swift
//  setGame
//
//  Created by Daniel Bermudez on 2/11/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var setGame  = Set()
  
 
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func test(_ sender: UIButton) {
           setGame.fillDeck()
        setGame.startGame()
    }
    
    
    
    


}

