//
//  UIHabitViewCell.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

class UIHabitViewCell: UITableViewCell {

    // MARK: - Subviews
    let habitView: UIHabitView = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let habit = Habit(name: "Example", date: dateFormatter.date(from: "09:00")!, trackDates: [], color: .blueRibbon)
        let view = UIHabitView(habit: habit)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, habit: Habit) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        habitView.habit = habit
        setupUI()
        addSubviews()
        setupConstraints()
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addSubviews()
        setupConstraints()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        contentView.addSubview(habitView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            habitView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            habitView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            habitView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
