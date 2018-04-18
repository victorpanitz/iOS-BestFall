//
//  CustomComponentsHandler.swift
//  BestFall
//
//  Created by Victor Magalhaes on 14/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

extension BestFallViewController {
    
    func setupPins(){
        let size = self.view.frame.width / 20
        let height = self.view.frame.height * 0.65
        let numOfRows = (height / size / 3) - 2
        for i in 0...Int(numOfRows){
            let verticalStep = (2 * size) + (CGFloat(i) * 3 * size) + self.view.frame.height * 0.15
            (i % 2) == 0 ? setupRowA(size, verticalStep) : setupRowB(size, verticalStep)
        }
    }
    
    func setupPointZone(height: CGFloat){
        let step = (self.view.frame.width / 6)
        let labelHeight = self.view.frame.height * 0.05
        let separatorHeight = self.view.frame.height * 0.1
        for i in 0...5 {
            if i != 5 {
                self.separatorView = UIView(frame: CGRect(
                    x: (step*CGFloat(i)) + step,
                    y: height  - (separatorHeight),
                    width: self.view.frame.width * 0.01,
                    height: separatorHeight)
                )
                setupSeparatorBar(self.separatorView)
            }
            self.bottomLabel = UILabel(frame: CGRect(
                x: (step*CGFloat(i)) + (step/2) - (self.view.frame.width * 0.015),
                y: height  - labelHeight,
                width: step,
                height: labelHeight)
            )

            i == 0 ? (self.bottomLabel?.text = "0")
                : i == 1 ? (self.bottomLabel?.text = "10")
                : i == 2 ? (self.bottomLabel?.text = "20")
                : i == 3 ? (self.bottomLabel?.text = "20")
                : i == 4 ? (self.bottomLabel?.text = "10")
                : (self.bottomLabel?.text = "0")
            
            self.bottomLabel?.textColor = UIColor.white
            self.baseView?.collisionZoneView.addSubview(bottomLabel!)
        }
    }
    
    fileprivate func setupSeparatorBar(_ bar: UIView){
        bar.backgroundColor = UIColor.white
        bar.layer.masksToBounds = false
        bar.layer.shadowRadius = 10
        bar.layer.shadowOpacity = 0.5
        bar.layer.shadowColor = UIColor.white.cgColor
        self.baseView?.collisionZoneView.addSubview(bar)
        self.collision.addItem(bar)
        self.anchor.addItem(bar)
    }
    
    fileprivate func setupRowA(_ size: CGFloat, _ verticalStep: CGFloat){
        for j in 0...5 {
            self.colliderPin = SphereView(frame: getFrameA(j, size, verticalStep))
            setPin(self.colliderPin!, size)
        }
    }
    
    fileprivate func setupRowB(_ size: CGFloat, _ verticalStep: CGFloat){
        for j in 0...6 {
            self.colliderPin = SphereView(frame: getFrameB(j, size, verticalStep))
            setPin(self.colliderPin!, size)
        }
    }
    
    fileprivate func setPin(_ pin: SphereView, _ size: CGFloat){
        pin.backgroundColor = UIColor.white
        pin.layer.cornerRadius = size / 2
        pin.layer.masksToBounds = false
        pin.layer.shadowRadius = 5
        pin.layer.shadowOpacity = 0.2
        pin.layer.shadowColor = UIColor.white.cgColor
        self.baseView?.collisionZoneView.addSubview(pin)
        self.collision.addItem(pin)
        self.anchor.addItem(pin)
    }
    
    fileprivate func getFrameA(_ pos: Int, _ size: CGFloat, _ verticalStep: CGFloat) -> CGRect {
        let step = CGFloat((pos * 3) + 2) * size
        let frame = CGRect(x: step, y: verticalStep, width: size, height: size)
        return frame
    }
    
    fileprivate func getFrameB(_ pos: Int, _ size: CGFloat, _ verticalStep: CGFloat) -> CGRect {
        var stepOffset = CGFloat(0)
        pos == 0 ? stepOffset = 0 : pos == 6 ? stepOffset = 1 : (stepOffset = 0.5)
        let step = (CGFloat(pos * 3) + stepOffset) * size
        let frame = CGRect(x: step, y: verticalStep, width: size, height: size)
        return frame
    }
    
}
