//
//  UITickButton.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

class UITickButton: UIButton {

    // MARK: - Subviews and Variables

    var color: UIColor
    var isTicked: Bool

    // MARK: - Lifecycle

    init(color:UIColor, isTicked:Bool){
        self.color = color
        self.isTicked = isTicked
        
        super.init(frame: .zero)
        
        if isTicked {
            let image = UIImage(systemName: "checkmark.circle.fill")
            self.setImage(image, for: .normal)

        } else {
            let image = UIImage(systemName: "circle")
            self.setImage(image, for: .normal)
        }
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
        self.tintColor = self.color
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
    }
    
    // MARK: - Actions
    
    @IBAction func didTapButton(sender: UIButton) {
        self.isTicked.toggle()
        if isTicked {
            let image = UIImage(systemName: "checkmark.circle.fill")
            self.setImage(image, for: .normal)

        } else {
            let image = UIImage(systemName: "circle")
            self.setImage(image, for: .normal)
        }
    }
}

extension UIImage {
    func imageWith(newSize: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: newSize).image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
        return image.withRenderingMode(renderingMode)
    }
}
