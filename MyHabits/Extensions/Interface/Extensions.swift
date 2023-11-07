//
//  Extensions.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class UITextFieldWithPadding: UITextField {
    
    // MARK: - Subviews
    
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 10,
        bottom: 0,
        right: 0
    )
    
    // MARK: - Lifecycle
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

class ColorCircle: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .green
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}

