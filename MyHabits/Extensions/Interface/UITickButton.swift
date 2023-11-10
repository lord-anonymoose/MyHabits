//
//  UITickButton.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

class UITickButton: UIButton {

    // MARK: - Subviews and Variables

    var isTicked: Bool

    // MARK: - Lifecycle

    init(isTicked:Bool){
        self.isTicked = isTicked
        super.init(frame: .zero)
        updateTick()
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        layoutSubviews()
        self.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
    }
    
    // MARK: - Actions
    
    @IBAction func didTapButton(sender: UIButton) {
        self.isTicked.toggle()
        updateTick()
    }
    
    // MARK: - Private
    
    private func updateTick() {
        if isTicked {
            let image = UIImage(systemName: "checkmark.circle.fill")
            self.setImage(image, for: .normal)

        } else {
            let image = UIImage(systemName: "circle")
            self.setImage(image, for: .normal)
        }
    }
}
