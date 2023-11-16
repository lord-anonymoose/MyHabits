//
//  UIHabitProgressView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 15.11.2023.
//

import UIKit

class UIHabitProgressView: UIView {
    
    // MARK: - Subviews
    
    private lazy var motivationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .electricViolet
        return view
    }()
    
    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        return label
    }()
    
    // MARK: Lifecycle
    
    init(){
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        setupConstraints()
        updateValues()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    func setupUI() {
        backgroundColor = .customBackground
    }
    
    private func addSubviews() {
        addSubview(motivationLabel)
        addSubview(progressLabel)
        addSubview(progressView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 72),
            
            motivationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            motivationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            motivationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            progressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            progressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 16),
            progressView.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    func updateValues() {
        if HabitsStore.shared.todayProgress == 1 {
            motivationLabel.text = "Well done!"
        } else {
            motivationLabel.text = "Just do it!"
        }
        
        progressView.progress = HabitsStore.shared.todayProgress
        
        progressLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
    }
}
