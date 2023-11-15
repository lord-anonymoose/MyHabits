//
//  UIHabitViewHeader.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 14.11.2023.
//

import Foundation
import UIKit

class UIHabitProgressHeaderView: UITableViewHeaderFooterView {

    // MARK: - Subviews
    let habitProgressView: UIHabitProgressView = {
        let view = UIHabitProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        contentView.addSubview(habitProgressView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitProgressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            habitProgressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            habitProgressView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            habitProgressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
