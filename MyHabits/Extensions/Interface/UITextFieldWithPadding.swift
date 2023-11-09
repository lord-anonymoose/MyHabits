//
//  UITextFieldWithPadding.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
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

class UITextFieldWithLimitedActions: UITextField {
    convenience init() {
        self.init(frame: .zero)
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
           .null
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer as? UILongPressGestureRecognizer == nil
    }
}
