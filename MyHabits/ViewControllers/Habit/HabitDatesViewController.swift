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
        tableView.isUserInteractionEnabled = false
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
        
        setupDependencies()
        setupUI()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setLargeTitleDisplayMode(.never)
    }
    
    // MARK: - Actions
    
    @IBAction func todayButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonTapped(sender: AnyObject) {
        if let row = HabitsStore.shared.habits.firstIndex(of: self.habit) {
            self.navigationController?.pushViewController(HabitEditViewController(row: row), animated: true)
        }
    }
    
    // MARK: - Private
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = self.habit.name
        
        let todayButton = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(todayButtonTapped))
        todayButton.tintColor = UIColor(named: "Electric Violet")
        navigationItem.leftBarButtonItems = [todayButton]

        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        editButton.tintColor = UIColor(named: "Electric Violet")
        navigationItem.rightBarButtonItems = [editButton]
        
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
    
    private func setupDependencies() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UIHabitViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension HabitDatesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let availableDates = prepareDates(habit: habit)
        return availableDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UIDateViewTableCell(style: .default, reuseIdentifier: "cell", habit: habit, date: prepareDates(habit: habit)[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

