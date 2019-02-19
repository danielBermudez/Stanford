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
//        drawCard(shape: "triangle", numberOfShapes: 2, shade: "", color: UIColor.blue)

//    let cardBack = UIBezierPath.init(rect: rect)
//        UIColor.yellow.setFill()
//        cardBack.fill()
//        // Drawing code
//        drawCard(shape: "triangle", numberOfShapes: 2, shade: "nil", color: "nil")
  
    }
   
    func drawCard(shape:String, numberOfShapes:Int, shade:String, color:UIColor){
        let card = SetCardView()
        let rect = CGRect(x: 0, y: 50, width: 200, height: 200)
        card.frame = rect
        addSubview(card)
        var path = [UIBezierPath]()
        if(shape == "triangle"){
            path = card.drawTriangles(center: card.bounds, numberOfShapes: CGFloat(numberOfShapes))
            }else if(shape == "square"){
                path = card.drawSquares(center: card.bounds, numberOfShapes: CGFloat(numberOfShapes))
                }else if(shape == "circle"){
                    path = card.drawCircles(center: card.bounds, numberOfShapes: CGFloat(numberOfShapes))
                     }
        for index in path.indices{
            var alpha = CGFloat()
            var fill = Bool()
            if(shade == "softFilling"){
                alpha = 0.5
                fill = true
            }else if (shade == "strongFilling"){
                alpha = 1
                fill = true
                
            }else {
                alpha = 1
                fill = false
            }
           card.setcolor(color: color, path: path[index],alpha:alpha,fill: fill)
            }
        }        
    }
    


