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
        let view = UIHabitView(name: "Example", time: "For example", color: UIColor(named: "Neon Carrot")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, isTicked: Bool) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.backgroundColor = .green
    }
    
    private func addSubviews() {
        contentView.addSubview(habitView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            habitView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            habitView.topAnchor.constraint(equalTo: contentView.topAnchor),
            habitView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            habitView.heightAnchor.constraint(equalToConstant: 144)
        ])
        print("constraints activated")
    }
}
