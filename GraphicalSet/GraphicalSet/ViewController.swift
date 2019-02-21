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
    
    @IBAction func AddCards(_ sender: Any) {
        setGame.addCardsToGame(numberOfCards: 3)
            drawCards()
    }
    @IBOutlet weak var setGameView : SetGameView!{
    didSet{
        
        setGame.startGame()
        setGame.fillDeck()
        drawCards()
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
    private func drawCards(){
        var frames = setGameView.addCards(NumberOFcards: setGame.gameDeck.count)
        for index in setGame.gameDeck.indices{
            
            setGameView.drawCard(shape: setGame.gameDeck[index].shape, numberOfShapes: setGame.gameDeck[index].numberOfShapes, shade: setGame.gameDeck[index].shade, color: setColorFromModel(color:setGame.gameDeck[index].color)!, frame: frames[index])
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
          
            
        
    }


}


