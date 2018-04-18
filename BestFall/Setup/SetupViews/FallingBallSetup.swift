//
//  FallingBallSetup.swift
//  BestFall
//
//  Created by Victor Magalhaes on 15/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

extension BestFallViewController {
    
    func generateFallingBall() {
        
        if self.fallingBallsArray.count > 4 {
            self.fallingBallsArray.removeAll()
        }
        
        self.view.setNeedsDisplay()
        let size = self.view.frame.width / 20

        self.fallingBall = SphereView(frame: CGRect(
            x: CGFloat(arc4random_uniform(UInt32(self.view.frame.width - size))),
            y: self.view.frame.height * 0.1 ,
            width: size/2,
            height: size/2)
        )
        self.isCounted = false
        self.fallingBall!.layer.cornerRadius = (size/4)
        self.fallingBall!.contentMode = UIViewContentMode.scaleToFill
        self.fallingBall!.backgroundColor = UIColor.red
        self.fallingBall!.clipsToBounds = true
        self.fallingBall!.image =  UIImage(named: "github")!
        self.fallingBallsArray.append(self.fallingBall!)
        self.baseView!.collisionZoneView.addSubview(self.fallingBallsArray[self.fallingBallsArray.count - 1])

        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.baseView!.collisionZoneView.backgroundColor = UIColor.red
            let newXPos = CGFloat(arc4random_uniform(UInt32(self.view.frame.width - size*2)))
            let newRadius = size*2
            self.fallingBall?.frame = CGRect(
                x: newXPos,
                y: self.view.frame.height * 0.1 ,
                width: newRadius,
                height: newRadius)
            self.fallingBallsArray[self.fallingBallsArray.count - 1].layer.cornerRadius = newRadius/2
            self.fallingBallsArray[self.fallingBallsArray.count - 1].backgroundColor = UIColor.purple
            
        }, completion: { (_) in
            
            self.energyLoss.addItem(self.fallingBallsArray[self.fallingBallsArray.count - 1])
            self.collision.addItem(self.fallingBallsArray[self.fallingBallsArray.count - 1])
            self.gravity.addItem(self.fallingBallsArray[self.fallingBallsArray.count - 1])
        })
        
    }
    
}
