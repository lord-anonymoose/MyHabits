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
    private lazy var motivationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        if HabitsStore.shared.todayProgress == 1 {
            label.text = "Well done!"
        } else {
            label.text = "Just do it!"
        }
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = HabitsStore.shared.todayProgress
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    // MARK: - Lifecycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubviews()
        //setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        contentView.addSubview(motivationLabel)
        contentView.addSubview(progressView)

    }
    
    private func setupConstraints() {
        
    }
}
