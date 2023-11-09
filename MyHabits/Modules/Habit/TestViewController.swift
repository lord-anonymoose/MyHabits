//
//  TestViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    func addSubviews() {
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
        ])
    }
    
    @objc func didTapColorSave(sender: UIDatePicker) {

    }
}

extension TestViewController: UIPickerViewDelegate {
}
