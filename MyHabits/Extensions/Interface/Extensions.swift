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
    var color: UIColor

    init(color:UIColor){
        
        self.color = color
        //Or you can use custom frame.
        //let frame = self.frame
        super.init(frame: .zero)
        layoutSubviews()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = self.color
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    public func updateColor() {
        self.backgroundColor = self.color
    }
}

enum customColor: String {
    case blueRibbon = "Blue Ribbon"
    case electricViolet = "Electric Violet"
    case forestGreen = "Forest Green"
    case neonCarrot = "Neon Carrot"
    case royalBlue = "Royal Blue"
    
    static let allValues = [blueRibbon, electricViolet, forestGreen, neonCarrot, royalBlue]
}

