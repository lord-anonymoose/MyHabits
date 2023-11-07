//
//  HabitFormView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class HabitFormView: UIView {

    // MARK: - Subviews
    
    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @IBAction func didTapColorSave(sender: AnyObject) {
    }
    
    // MARK: - Private

    private func setupUI() {
        
    }
    
    private func addSubviews() {
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
