//
//  TestViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    let habitView: UIHabitView = {
        let view = UIHabitView(name: "New Habit", time: "Daily at 15:00", color: UIColor(named: "Electric Violet") ?? .black)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        
        /*
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.date(from: "15:00")!

        let newHabit = Habit(name: "My New Habit", date: date, color: UIColor(named: "Neon Carrot")!)
        HabitsStore.shared.habits.append(newHabit)
        */
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.date(from: "15:00")!

        let newHabit = Habit(name: "My New Habit", date: date, color: UIColor(named: "Neon Carrot")!)
        HabitsStore.shared.habits.append(newHabit)
                
        setupUI()
        addSubviews()
        setupConstraints()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    func addSubviews() {
        view.addSubview(habitView)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            habitView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            habitView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            habitView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            habitView.heightAnchor.constraint(equalToConstant: 144)
        ])
    }
    
    @objc func didTapColorSave(sender: UIDatePicker) {

    }
}

extension TestViewController: UIPickerViewDelegate {
}
