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
        tableView.backgroundColor = .royalBlue
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        view.backgroundColor = .yellow //UIColor(named: "BackgroundColor")
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

extension HabitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //HabitsStore.shared.habits.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let post = posts[indexPath.row]
        let cell = PostViewCell(style: .default, reuseIdentifier: "cell", author: post.author, image: post.image, description: post.description, likes: post.likes, views: post.views)
        
        return cell
        */
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        return cell
        //return UIHabitViewCell(style: .default, reuseIdentifier: "cell", isTicked: true)
    }
}

extension HabitsViewController: UITableViewDelegate {
    
}
