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
    @IBOutlet weak var setGameView : SetGameView!{
    didSet{
        
        setGame.startGame()
        setGame.fillDeck()
        let cardModel = setGame.gameDeck[0]
        setGameView.drawCard(shape: cardModel.shape, numberOfShapes: cardModel.numberOfShapes, shade: cardModel.shade, color: setColorFromModel(color: cardModel.color)!)
        
        
    
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


