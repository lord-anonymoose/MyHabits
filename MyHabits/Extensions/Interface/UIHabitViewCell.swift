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
        let view = UIHabitView(name: "Example", time: "For example", color: UIColor(named: "Neon Carrot")!, isTicked: true)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, name: String, time: String, color: UIColor, isTicked: Bool) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        habitView.name = name
        habitView.time = time
        habitView.color = color
        habitView.isTicked = isTicked
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
        //print("constraints activated")
    }
}
