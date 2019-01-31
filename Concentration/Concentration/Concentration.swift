//
//  Concentration.swift
//  Concentration
//
//  Created by Daniel Bermudez on 1/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
class Concentration{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard :Int?
    var  score  = 0
    
    
func chooseCard(at index:Int){
    
        
    
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                cards[index].previouslySeen = true
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
                score = score + 2
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                if(cards[index].previouslySeen == true || cards[matchIndex].previouslySeen == true ){
                    score = score - 1
                }
               
            }
            else  {
                
                //either no cards or 2 cards are face up
                
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            
        }
        

        }
  
    init(numberOfPairsOfCards: Int)    {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        shuffleCards()
        
       
    }
  
    func restartCards(){
        for index in cards.indices{
            cards[index].isFaceUp=false
            cards[index].isMatched = false
            indexOfOneAndOnlyFaceUpCard = nil
        }
    }
    func shuffleCards(){
        cards.shuffle()
    }
}


