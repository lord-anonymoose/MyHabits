//
//  TestViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    private lazy var colorPickerView: ColorPickerView = {
        let pickerView = ColorPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        //pickerView.isHidden = false
        //pickerView.isUserInteractionEnabled = false
        return pickerView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        
        //datePicker.style = .wheels
        //datePicker.tintColor = .green
        datePicker.subviews[0].backgroundColor = .white
        //datePicker.setValue(UIColor.systemBackground, forKey: "backgroundColor")
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
        view.addSubview(colorPickerView)
        view.addSubview(datePicker)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            colorPickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            colorPickerView.topAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -48),
            colorPickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            colorPickerView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            datePicker.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            datePicker.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            datePicker.heightAnchor.constraint(equalToConstant: 48),
            datePicker.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16)
        ])

    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
    }
}
