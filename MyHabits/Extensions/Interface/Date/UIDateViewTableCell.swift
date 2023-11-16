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
        
    }
    
    private func addSubviews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
