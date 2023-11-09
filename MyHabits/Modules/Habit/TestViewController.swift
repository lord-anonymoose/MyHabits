//
//  TestViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    private lazy var colorPickerView: UIColorPickerView = {
        let pickerView = UIColorPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.colorSave.addTarget(self, action: #selector(didTapColorSave), for: .touchUpInside)
        return pickerView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.subviews[0].backgroundColor = .white
        return datePicker
    }()
    
    private lazy var colorCircle: UIColorCircleView = {
        let circle = UIColorCircleView(color: .yellow)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
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
        view.addSubview(colorPickerView)
        view.addSubview(colorCircle)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            colorPickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            colorPickerView.heightAnchor.constraint(equalToConstant: 320),
            colorPickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            colorPickerView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            colorCircle.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            colorCircle.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            colorCircle.heightAnchor.constraint(equalToConstant: 32),
            colorCircle.widthAnchor.constraint(equalToConstant: 32),
        ])

    }
    
    @IBAction func didTapColorSave(sender: AnyObject) {
        let color = colorPickerView.getColor()
        colorCircle.updateColor(color: color)
        colorPickerView.isHidden = true
    }
}
