//
//  SphereView.swift
//  BestFall
//
//  Created by Victor Magalhaes on 15/04/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation
import UIKit

class SphereView: UIImageView {
    // iOS 9 specific
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .ellipse
    }
}
