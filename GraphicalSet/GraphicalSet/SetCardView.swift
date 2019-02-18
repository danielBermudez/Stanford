//
//  SetCardView.swift
//  GraphicalSet
//
//  Created by Daniel esteban Bermudez valenzuela on 2/17/19.
//  Copyright © 2019 Daniel esteban Bermudez valenzuela. All rights reserved.
//

import UIKit

class SetCardView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let rounderRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        rounderRect.addClip()
        UIColor.white.setFill()
        rounderRect.fill()
        

        
        func drawTriangle(center:CGRect,side:CGFloat)->UIBezierPath{
        let path = UIBezierPath()
        let startX = center.midX
        
        let startY = center.midY - (side/3) 
        
        path.move(to: CGPoint(x: startX, y: startY))
        path.addLine(to: CGPoint(x: startX - (side/2) , y: startY + side / 2))
        path.addLine(to: CGPoint(x: startX + (side/2), y: startY + side / 2))
            path.close()
            return path
            
        }
        func drawSquare(center:CGRect,side:CGFloat)->UIBezierPath{
            
            let startX = center.midX - (side/2)
            
            let startY = center.midY - (side/2)
            let path = UIBezierPath(rect: CGRect(x:startX,y:startY,width:side,height:side))
           
            
            path.close()
            return path
            
        }
        func drawCircle(center:CGRect)->UIBezierPath{
        let path = UIBezierPath()
               path.addArc(withCenter:CGPoint(x:center.midX,y:center.midY), radius: 50.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            path.lineWidth = 5.0
            return path
        }
        func setcolor(color:UIColor,path :UIBezierPath,alpha:CGFloat){
            color.setFill()
            color.setStroke()
            path.fill(with: CGBlendMode.normal, alpha: alpha)
            path.stroke(with: CGBlendMode.normal, alpha: alpha)
            
        }
        
        let path = drawCircle(center: self.bounds)
        setcolor(color: UIColor.orange, path: path,alpha: 1)
        
        
      let pathTr = drawTriangle(center: (self.bounds), side: (self.bounds.width/2 ))
        UIColor.green.setFill()
        
//            path.fill()
//        path.stroke()
        
        let pathSq = drawSquare(center: (self.bounds), side: (self.bounds.width/2 ))
//        UIColor.green.setFill()
//
//        pathSq.fill()
//        pathSq.stroke()
//
//
        
  

    }
    

}
extension SetCardView{
    private struct SizeRatio{
        static let cornerFontsizeToBoundsHeight : CGFloat = 0.085
        static let cornerRadiusToBoundsHeight : CGFloat = 0.06
        static let cornerOffsetToCornerRadius : CGFloat = 0.033
        static let faceCardImageSizeToBoundsSize : CGFloat = 0.75
    }
    private var cornerRadius:CGFloat{
        return bounds.size.height*SizeRatio.cornerRadiusToBoundsHeight
    }

}
