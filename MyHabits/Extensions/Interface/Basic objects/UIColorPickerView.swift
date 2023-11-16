//
//  ColorPickerView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

// UIColorPickerView contains UIPicker for changing color and a save button

import UIKit

protocol ColorPickerDelegate:AnyObject {
    func colorPickerValueChanged(newColor:UIColor)
}

final class UIColorPickerView: UIView {

    // MARK: - Subviews

    weak var delegate:ColorPickerDelegate?
    var currentColor = UIColor(named: "Blue Ribbon") ?? .black {
        didSet {
            delegate?.colorPickerValueChanged(newColor: currentColor)
        }
    }
    
    lazy var colorPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    public lazy var saveButton: UIButton = {
        let button = UIButton(configuration: .gray())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
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
    
    @IBAction func didTapSaveButton(sender: AnyObject) {
        setIsHidden(true, animated: true)
    }
    
    // MARK: - Private

    private func setupUI() {
        self.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        addSubview(saveButton)
        addSubview(colorPicker)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            colorPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            colorPicker.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            colorPicker.heightAnchor.constraint(equalToConstant: 240),

            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.topAnchor.constraint(equalTo: colorPicker.bottomAnchor, constant: 8),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension UIColorPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return CustomColor.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CustomColor.allValues[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let rawValue = CustomColor.allValues[row].rawValue
        let color = UIColor(named: rawValue)
        self.currentColor = color ?? .black
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = CustomColor.allValues[row].rawValue
        let attribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let myTitle = NSAttributedString(string: titleData, attributes: attribute)
        return myTitle
    }
}
