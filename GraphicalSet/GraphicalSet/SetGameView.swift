//
//  SetGameView.swift
//  GraphicalSet
//
//  Created by Daniel Bermudez on 2/18/19.
//  Copyright © 2019 Daniel esteban Bermudez valenzuela. All rights reserved.
//

import UIKit

class SetGameView: UIView {
    var gameDeckView = [SetCardView]()

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let cardBack = UIBezierPath.init(rect: rect)
        UIColor.yellow.setFill()
        cardBack.fill()
        
        // Drawing code
        drawCard(shape: "triangle", numberOfShapes: 2, Shade: "nil", color: "nil", rect: rect)
    

}
    func drawCard(shape: String, numberOfShapes:Int, Shade:String,color:String, rect: CGRect){
        let card = SetCardView()
        card.draw(rect)
        if(shape == "triangle"){
           let path = card.drawTriangles(center: rect, numberOfShapes: CGFloat(numberOfShapes))
            for index in path.indices{
                card.setcolor(color: UIColor.green, path: path[index],alpha: 2)
            }
                
            }
        }
        
    }

