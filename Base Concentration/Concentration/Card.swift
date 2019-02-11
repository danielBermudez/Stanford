//
//  Card.swift
//  Concentration
//
//  Created by Daniel Bermudez on 1/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var previouslySeen = false
    var identifier: Int
    static var indentifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
