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
    func addCards(NumberOFcards:Int)-> [CGRect]{
        var frames = [CGRect]()
        var grid = Grid.init(layout: Grid.Layout.aspectRatio(2/3))
        grid.frame = self.bounds
        grid.cellCount = NumberOFcards
        for index in 0..<NumberOFcards
        { frames.append( grid[index]!)
        };return frames
    }
    func updateCard(card : SetCardView, frame : CGRect){
        
        card.frame = frame
        card.removeShape()
     
    }
   
    func drawCard(shape:String, numberOfShapes:Int, shade:String, color:UIColor, frame : CGRect){
        let card = SetCardView()
        card.frame = frame
        
        
        
        
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
        addSubview(card)
        
        }        
    }
    


