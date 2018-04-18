//
//  FunctionalitiesHandler.swift
//  BestFall
//
//  Created by Victor Magalhaes on 17/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

extension BestFallViewController {
    
    @objc func handleTap(){
        
        if !isAnimating {
            if self.counter > 4 {
                DispatchQueue.main.async {
                    for i in 0...4 {
                        self.energyLoss.removeItem(self.fallingBallsArray[i])
                        self.collision.removeItem(self.fallingBallsArray[i])
                        self.gravity.removeItem(self.fallingBallsArray[i])
                        self.fallingBallsArray[i].willMove(toSuperview: nil)
                        self.fallingBallsArray[i].removeFromSuperview()
                        self.fallingBallsArray[i].didMoveToSuperview()
                    }
                }
                self.score = 0
                self.counter = 0
                self.baseView!.gameStatusView.text = "\(counter)/5  SCORE: \(self.score)"

            }else{
                self.counter += 1
                self.isAnimating = true
                generateFallingBall()
            }
            
        }
    }
    
    func handleAnimationDidPause() {
        UIView.animate(withDuration: 1) {
            self.baseView!.collisionZoneView.backgroundColor = UIColor.purple
            self.fallingBall?.backgroundColor = UIColor.red
        }
        let baseDistance = (self.view.frame.width / 6) + (self.view.frame.width * 0.01)
        
        if !self.isCounted{
            if let currentPos = self.fallingBall?.center.x {
                (currentPos <= baseDistance) ? (self.score += 0)
                    : (currentPos <= 2 * baseDistance) ? (self.score += 10)
                    : (currentPos <= 3 * baseDistance) ? (self.score += 20)
                    : (currentPos <= 4 * baseDistance) ? (self.score += 20)
                    : (currentPos <= 5 * baseDistance) ? (self.score += 10)
                    : (self.score += 0)
                self.isCounted = true
                self.baseView!.gameStatusView.text = "\(counter)/5  SCORE: \(self.score)"
            }
        }
    }
    
}
