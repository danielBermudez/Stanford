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
    @IBOutlet var cardsView: [UIButton]!
    @IBAction private func addCards(_ sender:
        UIButton) {
        if(setGame.cardsShown < 24){
     setGame.dealAdditionalCards(numberOfCards: 3)
    updateViewFromModel()
        }else{
            sender.isEnabled = false
        }
        
    }
    
    @IBOutlet weak var addCardsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame.startGame()
        updateViewFromModel()
        
    }
   
    @IBOutlet private weak var scoreCount: UILabel!
    
    @IBOutlet weak var setCount: UILabel!
    
    func updateViewFromModel(){
       
        scoreCount.text = "Score: \(setGame.score)"
       setCount.text = "Sets: \(setGame.numberOfSets)"
        
        for index in 0..<setGame.cardsShown{
            let button = cardsView[index]
            let card = setGame.gameDeck[index]
            if (card.isSelected){
                button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                
            }else {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
           
            button.isEnabled = true
            let title = setTitleFromModel(card: card)
            print(title)
            button.setAttributedTitle(title, for: .normal)
            
            
        }
    }
  
    private func setTitleFromModel(card: setCard) -> NSAttributedString{
        let text = String(repeating: card.shape , count: card.numberOfShapes)
        let color = setColorFromModel(color : card.color)
        let shade =  setShadingFromModel(shading: card.shade)
        let attributes : [NSAttributedString.Key:Any] = [
            .strokeWidth: shade.stroke,
           . foregroundColor : color?.withAlphaComponent(shade.alpha) ?? UIColor.white
         
        
 
        ]
        return NSAttributedString(string:text,attributes:attributes)
        
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber =  cardsView.index(of: sender){
            setGame.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }
    }
    private func setShadingFromModel(shading :String)-> (stroke :Float,alpha : CGFloat){
       
        if(shading == "softFilling"){
            return  (0,0.3) }
            else if(shading == "unfilled"){
                return  (5.0,1)}
        else if (shading == "strongFilling"){return (0,1)}
        else{
            return (0,0)
        }
    }
       
    private func setColorFromModel(color :String)->UIColor?{
        if(color == "red"){
            return UIColor.red
        }else if(color == "green"){
            return  UIColor.green
        }else if (color == "blue"){
           return   UIColor.blue
        }else{ return nil}
        
    }
    func disableAllCards(){
        for index in cardsView.indices{
            
            let button = cardsView[index]
            button.isEnabled = false
            button.setTitle("", for: .normal)
          button.setAttributedTitle(nil, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.2584128082, green: 0.277672708, blue: 1, alpha: 1)
        }
    }
    @IBAction private func restartGame(_ sender: UIButton) {
        setGame.restartGame()
        disableAllCards()
        updateViewFromModel()
        addCardsButton.isEnabled = true
        
    }        
    }
    
    
    
    
    




