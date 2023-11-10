//
//  HabitView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

class UIHabitView: UIView {
    // MARK: - Subviews
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jogging"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "Electric Violet")
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Daily at 10:00"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    let tickButton: UITickButton = {
        let button = UITickButton(color: .green, isTicked: true)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    
    // MARK: - Lifecycle
/*
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, author: String, image: String, description: String, likes: Int, views: Int) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(author: author, image: image, description: description, likes: likes, views: views)
        setupConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(author: "Unknown", image: "notFound", description: "Unknown", likes: 0, views: 0)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews(author: "Unknown", image: "notFound", description: "Unknown", likes: 0, views: 0)
        setupConstraints()
    }
 */
    init() {
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

