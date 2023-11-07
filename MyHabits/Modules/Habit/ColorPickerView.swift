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
        //picker.isHidden = true
        return picker
    }()
    
    private lazy var colorSave: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.isHidden = true
        button.addTarget(self, action: #selector(didTapColorSave), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @IBAction func didTapColorSave(sender: AnyObject) {
        setIsHidden(true, animated: true)
    }
    
    // MARK: - Private

    private func setupUI() {
        self.backgroundColor = .systemBackground
        setIsHidden(false, animated: true)
    }
    
    private func addSubviews() {
        //self.isUserInteractionEnabled = false
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = customColor.allValues[row].rawValue
        let attribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let myTitle = NSAttributedString(string: titleData, attributes: attribute)
        return myTitle
    }
}

extension ColorPickerView {
    func setIsHidden(_ hidden: Bool, animated: Bool) {
        if animated {
            if self.isHidden && !hidden {
                self.alpha = 0.0
                self.isHidden = false
            }
            UIView.animate(withDuration: 0.50, animations: {
                self.alpha = hidden ? 0.0 : 1.0
            }) { (complete) in
                self.isHidden = hidden
            }
        } else {
            self.isHidden = hidden
        }
    }
}
