//
//  ColorPickerView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class ColorPickerView: UIView {

    // MARK: - Subviews

    private lazy var colorPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        picker.isHidden = false
        return picker
    }()
    
    private lazy var colorSave: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapColorSave), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @IBAction func didTapColorSave(sender: AnyObject) {
        hideUI()
    }
    
    // MARK: - Private

    private func setupUI() {
        
    }
    
    private func addSubviews() {
        self.isUserInteractionEnabled = false
        addSubview(colorSave)
        addSubview(colorPicker)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            colorSave.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorSave.topAnchor.constraint(equalTo: bottomAnchor, constant: -64),
            colorSave.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            colorSave.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            colorPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorPicker.topAnchor.constraint(equalTo: bottomAnchor, constant: -256),
            colorPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorPicker.bottomAnchor.constraint(equalTo: colorSave.topAnchor, constant: -16)
        ])
    }
    
    private func showUI() {
        colorPicker.isHidden = false
        colorSave.isHidden = false
    }
    
    private func hideUI() {
        colorPicker.isHidden = true
        colorSave.isHidden = true
    }
}

extension ColorPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return customColor.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(customColor.allValues[row].rawValue)
        return customColor.allValues[row].rawValue
    }
}
