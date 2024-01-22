//
//  UIAlertController.swift
//  Schedule
//
//  Created by Panchenko Oleg on 21.01.2024.
//

import UIKit

extension UIAlertController {
    
    func negativeWidthConstraint() {
        
        for subview in self.view.subviews {
            for constraints in subview.constraints where constraints.debugDescription.contains("width == -16") {
                subview.removeConstraint(constraints)
            }
        }
    }
}
