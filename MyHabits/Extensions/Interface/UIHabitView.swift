//
//  HabitView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

class UIHabitView: UIView {
    
    // MARK: - Subviews
    var habit: Habit {
        didSet {
            titleLabel.text = habit.name
            
            let date = habit.date
            var calendar = Calendar.current
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "HH:mm"
            let time = dateFormatter.string(from: date)
            
            timeLabel.text = "Daily at \(time)"
            titleLabel.textColor = habit.color
            tickButton.tintColor = habit.color
            tickButton.isTicked = habit.isAlreadyTakenToday
        }
    }
    
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

    init(habit: Habit){
        self.habit = habit
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        setupConstraints()
        setupDependencies()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @IBAction func updateHabit(sender: UIButton) {
        print("Habit updated")
        HabitsStore.shared.track(habit)
    }
    
    // MARK: - Private
    private func setupUI() {
        if traitCollection.userInterfaceStyle == .dark {
            backgroundColor = UIColor(named: "Very Dark Gray") ?? .secondarySystemBackground
        } else {
            backgroundColor = UIColor(named: "Wild Sand") ?? .secondarySystemBackground
        }
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(tickButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 144),
            
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
    
    private func setupDependencies() {
        tickButton.addTarget(self, action: #selector(updateHabit), for: .touchUpInside)
    }
}

