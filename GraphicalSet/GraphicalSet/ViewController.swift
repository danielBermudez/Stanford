//
//  ViewController.swift
//  GraphicalSet
//
//  Created by Daniel esteban Bermudez valenzuela on 2/17/19.
//  Copyright © 2019 Daniel esteban Bermudez valenzuela. All rights reserved.
//

import UIKit
@IBDesignable

class ViewController: UIViewController {
        var setGame = Set()
        var deckView = [SetCardView]()
    @IBOutlet weak var setGameView : SetGameView!{
    didSet{
        
        setGame.startGame()
        setGame.fillDeck()
        for index in setGame.gameDeck.indices{
        
            deckView.append(setGameView.drawCard(shape: setGame.gameDeck[index].shape, numberOfShapes: setGame.gameDeck[index].numberOfShapes, shade: setGame.gameDeck[index].shade, color: setColorFromModel(color:setGame.gameDeck[index].color)!))
        
        }
        setGameView.addCards(cards: deckView)
        
    
        }}
    private func setColorFromModel(color :String)->UIColor?{
        if(color == "red"){
            return UIColor.red
        }else if(color == "green"){
            return  UIColor.green
        }else if (color == "blue"){
            return   UIColor.blue
        }else{ return nil}
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
          
            
        
    }


}


