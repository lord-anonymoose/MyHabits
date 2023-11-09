//
//  UITimePickerView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
//

import UIKit

protocol TimePickerDelegate:AnyObject {
    func timePickerValueChanged(newTime:String)
}

class UITimePickerView: UIView {
    
    // MARK: - Subviews
    
    weak var delegate:TimePickerDelegate?
    var currentTime = "11:00" {
        didSet {
            delegate?.timePickerValueChanged(newTime: currentTime)
        }
    }
    
    private lazy var timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.subviews[0].backgroundColor = .white
        
        //datePicker.addTarget(self, action: #selector(didTapColorSave), for: UIControl.Event.valueChanged)

        return datePicker
    }()
    
    public lazy var saveButton: UIButton = {
        let button = UIButton(configuration: .gray())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitle("Save", for: .normal)
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
    
    // MARK: - Private
    private func setupUI() {
        self.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        addSubview(timePicker)
        addSubview(saveButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            timePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timePicker.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            timePicker.heightAnchor.constraint(equalToConstant: 48),
    
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 16),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }

}
