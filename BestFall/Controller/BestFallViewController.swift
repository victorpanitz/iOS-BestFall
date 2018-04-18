//
//  ViewController.swift
//  BestFall
//
//  Created by Victor Magalhaes on 13/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

class BestFallViewController: UIViewController, UIGestureRecognizerDelegate {
    //views
    var baseView: BaseView?
    var colliderPin: SphereView? = nil
    var fallingBall: SphereView? = nil
    var fallingBallsArray = [SphereView]()
    var bottomLabel: UILabel? = nil
    var separatorView = UIView()
    //behaviors
    var animator : UIDynamicAnimator? = nil
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    var anchor = UIDynamicItemBehavior()
    var energyLoss = UIDynamicItemBehavior()
    //control
    var isAnimating = false
    var isCounted = false
    var counter = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings()
    }
    
    override func viewDidLayoutSubviews() {
        setupPointZone(height : self.view.safeAreaLayoutGuide.layoutFrame.height * 0.95)
        self.baseView!.gameStatusView.text = "\(counter)/5  SCORE: \(self.score)"
    }
    
    func settings(){
        setupView()
        setupPins()
        setupBehaviors()
        setTapGesture()
    }
    
    fileprivate func setupView(){
        self.baseView = BaseView(frame: self.view.frame)
        
        self.view.addSubview(baseView!)
        self.baseView?.translatesAutoresizingMaskIntoConstraints = false
  
        NSLayoutConstraint.activate([
            self.baseView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.baseView!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.baseView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.baseView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
    }
    
    fileprivate func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
}

