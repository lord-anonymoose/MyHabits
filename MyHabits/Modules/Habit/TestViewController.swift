//
//  TestViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TIME"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    private lazy var timePickerView: UITimePickerView = {
        let timePickerView = UITimePickerView()
        timePickerView.translatesAutoresizingMaskIntoConstraints = false
        return timePickerView
    }()
    
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
        view.addSubview(timePickerView)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            timePickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            timePickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            timePickerView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            timePickerView.heightAnchor.constraint(equalToConstant: 112)
        ])
    }
    
    @objc func didTapColorSave(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short

        //var strDate = timeFormatter.string(from: timePickerView.date)
        //print(strDate)
    }
}

extension TestViewController: UIPickerViewDelegate {
}
