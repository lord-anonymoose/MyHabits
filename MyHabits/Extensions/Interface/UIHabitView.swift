//
//  HabitView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

class UIHabitView: UIView {
    // MARK: - Subviews
    
    var name: String
    var time: String
    var color: UIColor
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    let tickButton: UITickButton = {
        let button = UITickButton(isTicked: true)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    
    // MARK: - Lifecycle

    init(name:String, time: String, color: UIColor){
        self.name = name
        self.time = time
        self.color = color
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        setupConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func setupUI() {
        backgroundColor = UIColor(named: "Wild Sand") ?? .secondarySystemBackground
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(tickButton)
        titleLabel.text = self.name
        titleLabel.textColor = self.color
        timeLabel.text = "Daily at \(String(self.time))"
        tickButton.tintColor = self.color
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            timeLabel.heightAnchor.constraint(equalToConstant: 16),
            
            tickButton.widthAnchor.constraint(equalToConstant: 48),
            tickButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            tickButton.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            tickButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48)
        ])
    }
}

