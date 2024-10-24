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
        let tableView = UITableView().habitsView(isHeaderHidden: true)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setLargeTitleDisplayMode(.always)

        habitsView.reloadData()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let habitsCreateViewController = HabitCreateViewController()
        self.navigationController?.pushViewController(habitsCreateViewController, animated: true)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        habitsView.reloadData()
        habitsView.refreshControl?.endRefreshing()
    }

    @objc func habitTapped(_ sender: UITapGestureRecognizer) {

        guard let cell = sender.view as? UITableViewCell else { return }
        
        let habit = HabitsStore.shared.habits[cell.tag]
        self.navigationController?.pushViewController(HabitDatesViewController(habit: habit), animated: true)
    }
    
    @IBAction func habitTicked(sender: UIButton) {
        habitsView.reloadData()
    }
    
    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .systemBackground

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
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
            habitsView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            habitsView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            habitsView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            habitsView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
    }
    
    private func setupDependencies() {
        habitsView.delegate = self
        habitsView.dataSource = self
        habitsView.register(UIHabitViewCell.self, forCellReuseIdentifier: "cell")
        habitsView.register(UIHabitProgressHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    
        if #available(iOS 10.0, *) {
            habitsView.refreshControl = refreshControl
        } else {
            habitsView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
}

extension HabitsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habit = HabitsStore.shared.habits[indexPath.row]
        let cell = UIHabitViewCell(style: .default, reuseIdentifier: "cell", habit: habit)
        
        cell.tag = indexPath.row
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(habitTapped(_:)))
        cell.addGestureRecognizer(tapGestureRecognizer)
        
        cell.habitView.tickButton.addTarget(self, action: #selector(habitTicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? UIHabitProgressHeaderView {
                view.habitProgressView.updateValues()
                view.habitProgressView.setupUI()
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

