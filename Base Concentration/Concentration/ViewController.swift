//
//  ViewController.swift
//  Concentration
//
//  Created by Daniel Bermudez on 1/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    private(set) var flipCount = 0 {
    didSet{
        updateFlipCountLabel()
        
    }
    }
    private func updateFlipCountLabel(){
        let attributes:[ NSAttributedString.Key:Any] = [
            .strokeWidth : 5.0,
            .strokeColor :  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)",attributes:attributes)
        flipCountLabel.attributedText = attributedString
        
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
            
        }
    }
    
    
   
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
//         game.flipsSum()
        flipCount = flipCount + 1
        
        
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }else {
            print("chosen card was not in cardButtons")
        }
       
        
    }
  
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
            
//            scoreCount.text = "Score : \(game.score) "
//            flipCountLabel.text = "Flips : \(game.flips)"
            updateFlipCountLabel()
            
            
            
    
        }
    }
    var themes  = [[ "🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎","👹","👺","👽","💀"],[ "🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🦁","🐵","🐤","🐴"],[ "🐠","🐟","🐬","🐳","🐋","🦀","🐡","🐙","🦑","🦞","🐊","🐢","🐸"],[ "🍔","🍟","🍕","🥪","🥙","🌭","🌯","🍗","🥘","🍘","🌮","🍝","🍛"],[ "⚽️","🏈","🏀","🥋","🎾","🏏","🏐","🎱","🏓","🤸🏻‍♂️","🏄‍♂️","🚴‍♂️","⛳️"]]
    
    
    var emoji=Dictionary<Int,String>()
    lazy var emojichoices: [String] = themes[Int(arc4random_uniform(UInt32(themes.count)))]
    func emoji(for card : Card) -> String {

        if emoji[card.identifier] == nil ,emojichoices.count > 0 {
             
            let randomIndex = Int(arc4random_uniform(UInt32(emojichoices.count)))
            emoji[card.identifier] = emojichoices.remove(at: randomIndex)
        }
        
    return emoji[card.identifier] ?? "?"
        
    }
    func restartEmoji(){
        emoji.removeAll()
        emojichoices.removeAll()
        emojichoices = themes[Int(arc4random_uniform(UInt32(themes.count)))]
    }
    
    
   
        @IBAction func Restart(_ sender: UIButton) {
            
            flipCount=0
            game.restartGame()
            restartEmoji()
            game.shuffleCards()
            game.restartCards()
            updateViewFromModel()
        }
       
            
    


}
