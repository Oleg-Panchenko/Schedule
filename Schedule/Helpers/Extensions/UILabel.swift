//
//  UILabel.swift
//  Schedule
//
//  Created by Panchenko Oleg on 21.01.2024.
//
import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, alignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
