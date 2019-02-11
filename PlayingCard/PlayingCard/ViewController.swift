//
//  ViewController.swift
//  PlayingCard
//
//  Created by Daniel esteban Bermudez valenzuela on 2/10/19.
//  Copyright © 2019 Daniel esteban Bermudez valenzuela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var deck = PlayinCardDeck()
        for _ in 1...10 {
            if let card = deck.draw(){
                print("\(card)")
            }
        }
    }


}

