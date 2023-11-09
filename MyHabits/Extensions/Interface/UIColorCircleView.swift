//
//  ColorCircleView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
//

import UIKit

class UIColorCircleView: UIView {
    var color: UIColor

    init(color:UIColor){
        self.color = color
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
    
    public func updateColor(color: UIColor) {
        self.color = color
        self.backgroundColor = self.color
    }
}

