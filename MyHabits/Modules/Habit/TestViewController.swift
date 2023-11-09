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
    
    private let timeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Daily at ", attributes: firstAttribute)

        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "Electric Violet") ?? .label]
        let secondString = NSAttributedString(string: "11:00", attributes: secondAttribute)

        let resultString = NSMutableAttributedString()
        resultString.append(firstString)
        resultString.append(secondString)
        
        button.setAttributedTitle(resultString, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.contentHorizontalAlignment = .left

        return button
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.subviews[0].backgroundColor = .white
        
        datePicker.addTarget(self, action: #selector(didTapColorSave), for: UIControl.Event.valueChanged)

        return datePicker
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
        view.addSubview(timeLabel)
        view.addSubview(timeButton)
        view.addSubview(timePicker)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            timeLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            timeLabel.heightAnchor.constraint(equalToConstant: 16),
            
            timeButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            timeButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            timeButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 16),
            timeButton.heightAnchor.constraint(equalToConstant: 16),
            
            timePicker.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            timePicker.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            timePicker.topAnchor.constraint(equalTo: timeButton.bottomAnchor, constant: 16),
            timePicker.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func didTapColorSave(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short

        var strDate = timeFormatter.string(from: timePicker.date)
        print(strDate)
    }
}

extension TestViewController: UIPickerViewDelegate {
}
