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
    var indexOfOneAndOnlyFaceUpCard :Int?   {
        get{
           return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
            
        }set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    var  score  = 0
    var flips = 0
    
    
func chooseCard(at index:Int){
    
        
    
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
                scorePoint()
                cards[index].previouslySeen = false
                cards[matchIndex].previouslySeen = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                if(cards[index].previouslySeen == true && cards[matchIndex].previouslySeen == true ){
                    penalize(val:2)
                }else if(cards[index].previouslySeen == true || cards[matchIndex].previouslySeen == true){
                    penalize(val:1)
                }
                cards[index].previouslySeen = true
                cards[matchIndex].previouslySeen = true
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
    func scorePoint(){
        score = score + 2
    }
    func penalize(val : Int){
        score = score - val
        
    }
    func flipsSum(){
        flips = flips + 1
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
              cards[index].previouslySeen = false
            indexOfOneAndOnlyFaceUpCard = nil
        }
        
    }
    func restartGame(){
        score = 0
        flips = 0
        
    }
    func shuffleCards(){
        cards.shuffle()
    }
}
extension Collection {
    var oneAndOnly:Element?{
        return count == 1 ? first : nil
    }
}


