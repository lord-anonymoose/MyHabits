//
//  UITextFieldWithPadding.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
//

import UIKit

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
