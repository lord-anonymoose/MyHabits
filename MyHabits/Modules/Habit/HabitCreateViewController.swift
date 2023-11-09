//
//  HabitCreateViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class HabitCreateViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TITLE"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Morning jogging, 8 hours sleep etc..."
        textField.font = .systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "COLOR"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var colorCircle: UIColorCircleView = {
        let circle = UIColorCircleView(color: UIColor(named: "Blue Ribbon") ?? .black)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(colorCircleTapped))
        circle.addGestureRecognizer(tap)
        return circle
    }()
    
    private lazy var colorPickerView: UIColorPickerView = {
        let pickerView = UIColorPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.colorSave.addTarget(self, action: #selector(didTapColorSave), for: .touchUpInside)
        pickerView.isHidden = true
        pickerView.alpha = 0.0
        //pickerView.colorPicker
        return pickerView
    }()
    
    // MARK: - Actions
    
    @IBAction func colorCircleTapped(sender: AnyObject) {
        colorPickerView.setIsHidden(false, animated: true)
    }
    
    @IBAction func didTapColorSave(sender: AnyObject) {
        let color = colorPickerView.getColor()
        colorCircle.updateColor(color: color)
        colorPickerView.setIsHidden(true, animated: true)
    }
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "TIME"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timeSelection: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Daily at ", attributes: firstAttribute)

        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "electricViolet") ?? .link]
        let secondString = NSAttributedString(string: "15:00", attributes: secondAttribute)

        let resultString = NSMutableAttributedString()
        resultString.append(firstString)
        resultString.append(secondString)
        
        button.setAttributedTitle(resultString, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView.delegate = self
        setupUI()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorCircle)
        view.addSubview(colorPickerView)
        view.addSubview(timeLabel)
    }
    
    private func setupConstraints() {

        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            titleTextField.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            titleTextField.heightAnchor.constraint(equalToConstant: 18),
            
            colorLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            colorLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            colorLabel.heightAnchor.constraint(equalToConstant: 16),
            
            colorCircle.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            colorCircle.widthAnchor.constraint(equalToConstant: 32),
            colorCircle.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 16),
            colorCircle.heightAnchor.constraint(equalToConstant: 32),
            
            timeLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: colorCircle.bottomAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            
            colorPickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            colorPickerView.heightAnchor.constraint(equalToConstant: 320),
            colorPickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            colorPickerView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Create a habit"
        
        //let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
        //saveButton.tintColor = UIColor(named: "Electric Violet") ?? .blue
        //let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        //cancelButton.tintColor = UIColor(named: "Electric Violet") ?? .blue
        
        //navigationItem.rightBarButtonItems = [saveButton]
        //navigationItem.leftBarButtonItems = [cancelButton]
    }
    
    // Setting character limit for UITextField (48 characters)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 48
    }
}

extension HabitCreateViewController: UIPickerViewDataSource, UIPickerViewDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return customColor.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.colorCircle.color = UIColor(named: customColor.allValues[row].rawValue) ?? .black
        self.colorCircle.updateColor(color: .black)
        return customColor.allValues[row].rawValue
    }
}

extension HabitCreateViewController: ColorPickerDelegate {
    func colorPickerValueChanged(newColor:UIColor) {
        colorCircle.updateColor(color: newColor)
    }
}
