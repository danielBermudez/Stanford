//
//  Set.swift
//  setGame
//
//  Created by Daniel Bermudez on 2/12/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
class Set{
    private var completeDeck = [setCard]()
    private(set) var cardsShown = 12
    private var selectedCardsIndexs = [0,0]
    private(set) var numberOfSets = 0
    private(set) var score = 0
    private(set) var gameDeck = [setCard]()
    
    
    func fillDeck(){
        for numberOfShapes in setCardCaracteristics.numberOfShapes.allCases{
            for shape in setCardCaracteristics.shapes.allCases{
                for color in setCardCaracteristics.colors.allCases{
                for shade in setCardCaracteristics.shadings.allCases{
                    var card = setCard()
                    card.setNumber(numberOfShapes: numberOfShapes.rawValue)
                    card.setShape( shape: shape.rawValue)
                    card.setColor( color: color.rawValue)
                     card.setshade(shade: shade.rawValue)
                    completeDeck.append(card)
                    }
                }
            }
        
    }
    }
    func chooseCard(at index :Int){
//        No Cards Selected
        if(selectedCardsIndexs[0] == 0 && selectedCardsIndexs[1] == 0){
            selectedCardsIndexs[0] = index
            completeDeck[index].setSelected(selection: true)}
//            One card selected
            else if(selectedCardsIndexs[0] != 0 && selectedCardsIndexs[1] == 0){
            selectedCardsIndexs[0] = index
            completeDeck[index].setSelected(selection: true)
//       two cards selected
        }else{
            validateSet()
            for flipDownIndex in completeDeck.indices{
                completeDeck[flipDownIndex].setSelected(selection: false)
            }
        }
        
        }
    func DealAdditionalCards(numberOfCards:Int){
        cardsShown = cardsShown + numberOfCards
        addCardsToGame(numberOfCards: numberOfCards)
        
    }
    func validateSet(){
        
    }
    func startGame(){
        addCardsToGame(numberOfCards: cardsShown)
      
        
    }
    func addCardsToGame(numberOfCards:Int){
        for _ in 0 ..< numberOfCards{
            let randomCardIndex = completeDeck.index(completeDeck.startIndex, offsetBy: completeDeck.count.arc4random)
            let randomCard = completeDeck[randomCardIndex]
            gameDeck.append(randomCard)
            completeDeck.remove(at: randomCardIndex)
            
        }
        
        
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
        
    }
    
}

