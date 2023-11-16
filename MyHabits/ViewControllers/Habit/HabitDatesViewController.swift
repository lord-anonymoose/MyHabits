//
//  HabitDatesViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 16.11.2023.
//

import UIKit

class HabitDatesViewController: UIViewController {
    
    // MARK: - Subviews
    var habit: Habit {
        didSet {
            
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK - Lifecycle
    init(habit: Habit)
    {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupDependecies()
        setupUI()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Actions
    
    @IBAction func todayButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private
    
    private func setupUI() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = self.habit.name
        let todayButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(todayButtonTapped))
        todayButton.tintColor = UIColor(named: "Electric Violet")
        navigationItem.leftBarButtonItems = [todayButton]
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
        
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
    }
}

extension HabitDatesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 176
        return 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? UIHabitProgressHeaderView {
                view.habitProgressView.updateValues()
                return view
            }
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 104
        } else {
            return 0
        }
    }
}

