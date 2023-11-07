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
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            colorPickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            colorPickerView.topAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -48),
            colorPickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            colorPickerView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            //colorPickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            //colorPickerView.topAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -240),
            //colorPickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            //colorPickerView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])

    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
    }
}
