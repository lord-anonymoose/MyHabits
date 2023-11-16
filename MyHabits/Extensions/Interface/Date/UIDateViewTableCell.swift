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
            dateLabel.text = dateToString(date: date)
        }
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tickButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        button.clipsToBounds = true
        let image = UIImage(systemName: "checkmark.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .electricViolet
        return button
    }()
    
    // MARK: - Lifecycle
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, habit: Habit, date: Date) {
        self.habit = habit
        self.date = date
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addSubviews()
        setupDependencies()
        setupConstraints()
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.date = Date()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addSubviews()
        setupDependencies()
        setupConstraints()
    }
        
    required init?(coder aDecoder: NSCoder) {
        self.date = Date()
        super.init(coder: aDecoder)
        setupUI()
        addSubviews()
        setupDependencies()
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
        contentView.addSubview(tickButton)
    }
    
    private func setupDependencies() {
        var text = dateToString(date: self.date)
        if let habit = self.habit {
            if MyHabits.checkDate(date: date, habit: habit) {
                tickButton.isHidden = false
            } else {
                tickButton.isHidden = true
            }
        }
        dateLabel.text = text
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),
            
            tickButton.widthAnchor.constraint(equalToConstant: 22),
            tickButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tickButton.heightAnchor.constraint(equalToConstant: 22),
            tickButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            tickButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
        ])
    }
}
