//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 03.11.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    // MARK: - Subviews

    private lazy var habitsView: UITableView = {
        let tableView = UITableView().habitsView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        addSubviews()
        setupDependencies()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        print("Add button tapped")
    }
    
    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        //let date = dateFormatter.date(from: dateStringCleared)!
        
        //let firstHabit = Habit(name: "Wake up at 6", date: dateFormatter.date(from: "06:00")!, color: UIColor(named: "Neon Carrot")!)
        //HabitsStore.shared.habits.append(firstHabit)
        
        //let secondHabit = Habit(name: "Go to bad at 22", date: dateFormatter.date(from: "22:00")!, color: UIColor(named: "Neon Carrot")!)
        //HabitsStore.shared.habits.append(secondHabit)
        
        print(HabitsStore.shared.habits)

    }
    
    func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = UIColor(named: "Electric Violet")
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    private func addSubviews() {
        view.addSubview(habitsView)
    }

    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            habitsView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 0),
            habitsView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: 0),
            habitsView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0),
            habitsView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0)
        ])
    }
    
    private func setupDependencies() {
        habitsView.delegate = self
        habitsView.dataSource = self
        habitsView.register(UIHabitViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension HabitsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habit = HabitsStore.shared.habits[indexPath.row]
        let cell = UIHabitViewCell(style: .default, reuseIdentifier: "cell", name: habit.name, time: "12:34", color: habit.color, isTicked: false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
}

