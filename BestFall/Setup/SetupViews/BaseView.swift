//
//  BaseCustomLayout.swift
//  BestFall
//
//  Created by Victor Magalhaes on 14/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

class BaseView : UIView {
    
    var gameStatusView : UILabel = {
        let mLabel = UILabel()
        mLabel.textColor = UIColor.white
        mLabel.textAlignment = .center
        mLabel.backgroundColor = UIColor.purple
        return mLabel
    }()
    
    let collisionZoneView : UIView = {
        let mView = UIView()
        mView.backgroundColor = UIColor.purple
        return mView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupLayout(_ frame: CGRect){
        
        self.addSubview(gameStatusView)
        gameStatusView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collisionZoneView)
        collisionZoneView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            self.gameStatusView.topAnchor.constraint(equalTo: self.topAnchor),
            self.gameStatusView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gameStatusView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.gameStatusView.heightAnchor.constraint(equalToConstant: frame.height * 0.05),

            self.collisionZoneView.topAnchor.constraint(equalTo: self.gameStatusView.bottomAnchor),
            self.collisionZoneView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.collisionZoneView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collisionZoneView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
            ])
        
    }
    
}
