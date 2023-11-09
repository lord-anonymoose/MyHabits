//
//  UITimePickerView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 09.11.2023.
//

import UIKit

protocol TimePickerDelegate:AnyObject {
    func timePickerValueChanged(newTime:NSAttributedString)
}

class UITimePickerView: UIView {
    
    // MARK: - Subviews
    
    weak var delegate:TimePickerDelegate?
    var currentTime: NSAttributedString = NSAttributedString(string: "Daily at 15:00"){
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.date(from: "15:00")
        datePicker.date = date!
        
        datePicker.addTarget(self, action: #selector(valueDidChange), for: UIControl.Event.valueChanged)
        return datePicker
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
    
    @IBAction func valueDidChange(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short

        let strDate = timeFormatter.string(from: timePicker.date)
        
        currentTime = timeToString(time: strDate)
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

extension UITimePickerView {
    private func timeToString(time: String) -> NSMutableAttributedString {
        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Daily at ", attributes: firstAttribute)

        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "Electric Violet") ?? .link]
        let secondString = NSAttributedString(string: time, attributes: secondAttribute)

        let resultString = NSMutableAttributedString()
        resultString.append(firstString)
        resultString.append(secondString)
        
        return resultString
    }
}

