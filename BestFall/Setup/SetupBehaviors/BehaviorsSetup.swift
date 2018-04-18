//
//  FallingBallBehavior.swift
//  BestFall
//
//  Created by Victor Magalhaes on 14/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

extension BestFallViewController: UIDynamicAnimatorDelegate {
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        handleAnimationDidPause()
        self.isAnimating = false
    }
    
    func setupBehaviors(){
        self.animator = {
            let mAnimatior = UIDynamicAnimator(referenceView: self.baseView!.collisionZoneView)
            mAnimatior.delegate = self
            return mAnimatior
        }()
        
        //gravity
        let vector = CGVector(dx: 0.0, dy: 1.0)
        self.gravity.gravityDirection = vector
        
        //collision
        self.collision.translatesReferenceBoundsIntoBoundary = true
        
        //falling ball behaviors
        self.energyLoss.elasticity = 0.5
        self.energyLoss.friction = 0.5
        self.energyLoss.allowsRotation = true

        //pins behaviors
        self.anchor.isAnchored = true
        self.anchor.allowsRotation = true
        self.anchor.friction = 0.5
        self.anchor.resistance = 0.0
        
        //add to animator
        self.animator?.addBehavior(self.energyLoss)
        self.animator?.addBehavior(self.gravity)
        self.animator?.addBehavior(self.collision)
        self.animator?.addBehavior(self.anchor)
    }
    
}
