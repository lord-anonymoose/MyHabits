//
//  UIDateViewTableCell.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 16.11.2023.
//

import UIKit

final class UIDateViewTableCell: UITableViewCell {
    
    // MARK: Subviews
    var habit: Habit? {
        didSet {
            
        }
    }
    
    var date: Date {
        didSet {
            
        }
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example Text"
        return label
    }()
    
    let tickButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    // MARK: - Lifecycle
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, habit: Habit, date: Date) {
        self.habit = habit
        self.date = date
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addSubviews()
        setupConstraints()
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.date = Date()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addSubviews()
        setupConstraints()
    }
        
    required init?(coder aDecoder: NSCoder) {
        self.date = Date()
        super.init(coder: aDecoder)
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    // MARK: - Private
    
    private func checkDate() -> Bool {
        return true
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        contentView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
