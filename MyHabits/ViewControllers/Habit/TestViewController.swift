//
//  TestViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 15.11.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    private lazy var habitProgressView: UIHabitProgressView = {
        let habitProgressView = UIHabitProgressView()
        habitProgressView.translatesAutoresizingMaskIntoConstraints = false
        habitProgressView.layer.cornerRadius = 8
        return habitProgressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(habitProgressView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            habitProgressView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            habitProgressView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            habitProgressView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            //habitProgressView.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
}
