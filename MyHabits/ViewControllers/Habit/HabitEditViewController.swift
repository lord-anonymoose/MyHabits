//
//  HabitEditViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class HabitEditViewController: UIViewController {
    
    // MARK: - Subviews
    var row: Int {
        willSet {
            titleLabel.text = HabitsStore.shared.habits[row].name
        }
        didSet {
            titleLabel.text = HabitsStore.shared.habits[row].name
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TITLE"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    private lazy var titleTextField: UITextFieldWithLimitedActions = {
        let textField = UITextFieldWithLimitedActions()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.placeholder = "Morning jogging, 8 hours sleep etc..."
        textField.font = .systemFont(ofSize: 16)
        textField.delegate = self
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "COLOR"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
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
        pickerView.isHidden = true
        pickerView.alpha = 0.0
        return pickerView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TIME"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    private lazy var timeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Daily at ", attributes: firstAttribute)

        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "Electric Violet") ?? .link]
        let secondString = NSAttributedString(string: "15:00", attributes: secondAttribute)

        let resultString = NSMutableAttributedString()
        resultString.append(firstString)
        resultString.append(secondString)
        
        button.setAttributedTitle(resultString, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.contentHorizontalAlignment = .left
                
        button.addTarget(self, action: #selector(timeButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var timePickerView: UITimePickerView = {
        let timePickerView = UITimePickerView()
        timePickerView.translatesAutoresizingMaskIntoConstraints = false
        timePickerView.isHidden = true
        return timePickerView
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .wildSand
        /*
        if traitCollection.userInterfaceStyle == .dark {
            button.backgroundColor = .veryDarkGray ?? .secondarySystemBackground
        } else {
            button.backgroundColor = .wildSand ?? .secondarySystemBackground
        }
        */
        button.layer.cornerRadius = 8
        button.setTitle("Delete Habit", for: .normal)
        button.tintColor = .systemRed
        return button
    }()
    
    // MARK: - Lifecycle
    init(row:Int)
    {
        self.row = row
        super.init(nibName: nil, bundle: nil)
        
        let name = HabitsStore.shared.habits[self.row].name
        titleTextField.insertText(name)
        
        let color = HabitsStore.shared.habits[self.row].color
        colorCircle.color = color
        if let colorRow = color.index {
            colorPickerView.colorPicker.selectRow(colorRow, inComponent: 0, animated: false)
        }
        
        let date = HabitsStore.shared.habits[self.row].date
        timePickerView.timePicker.date = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let time = dateFormatter.string(from: date)
        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Daily at ", attributes: firstAttribute)
        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "Electric Violet") ?? .link]
        let secondString = NSAttributedString(string: time, attributes: secondAttribute)
        let resultString = NSMutableAttributedString()
        resultString.append(firstString)
        resultString.append(secondString)
        timeButton.setAttributedTitle(resultString, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDependecies()
        setupUI()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Actions
    
    @IBAction func colorCircleTapped(sender: AnyObject) {
        self.view.endEditing(true)
        if !timePickerView.isHidden {
            timePickerView.setIsHidden(true, animated: true)
        }
        colorPickerView.setIsHidden(false, animated: true)
    }
    
    @IBAction func timeButtonTapped(sender: AnyObject) {
        if !colorPickerView.isHidden {
            colorPickerView.setIsHidden(true, animated: true)
        }
        timePickerView.setIsHidden(false, animated: true)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        let name = titleTextField.text!
        
        if name.replacingOccurrences(of: " ", with: "") == "" {
            self.showEmptyHabitAlert()
        } else {
            let dateString = timeButton.currentAttributedTitle?.string ?? "Daily at 15:00"
            let dateStringCleared = dateString.replacingOccurrences(of: "Daily at ", with: "")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "HH:mm"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            let date = dateFormatter.date(from: dateStringCleared)!
            
            let color = colorCircle.color
            let newHabit = Habit(name: name, date: date, color: color)
            
            HabitsStore.shared.habits[row] = newHabit
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        let alert = UIAlertController(
            title: "Are you sure?",
            message: "You will not be able to recover this habit anymore",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "Delete",
            style: .destructive,
            handler: { _ in
                HabitsStore.shared.habits.remove(at: self.row)
                self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: { _ in
        }))
        present(alert,
                animated: true,
                completion: nil
        )
    }
    
    // MARK: - Private
    private func setupDependecies() {
        self.hideKeyboardWhenTappedAround()
        colorPickerView.delegate = self
        timePickerView.delegate = self
        titleTextField.delegate = self
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        overrideUserInterfaceStyle = .light
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorCircle)
        view.addSubview(colorPickerView)
        view.addSubview(timeLabel)
        view.addSubview(timeButton)
        view.addSubview(timePickerView)
        view.addSubview(deleteButton)
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
            
            timeButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            timeButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            timeButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 16),
            timeButton.heightAnchor.constraint(equalToConstant: 32),
            
            timePickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            timePickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            timePickerView.bottomAnchor.constraint(equalTo: deleteButton.topAnchor, constant: -64),
            timePickerView.heightAnchor.constraint(equalToConstant: 120),
            
            colorPickerView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            colorPickerView.heightAnchor.constraint(equalToConstant: 320),
            colorPickerView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            colorPickerView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            deleteButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            deleteButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            deleteButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -16),
            deleteButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Edit"
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
        saveButton.tintColor = UIColor(named: "Electric Violet") ?? .blue
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = UIColor(named: "Electric Violet") ?? .blue
        
        navigationItem.rightBarButtonItems = [saveButton]
        navigationItem.leftBarButtonItems = [cancelButton]
    }
    
    // Setting character limit for UITextField (48 characters)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 48
    }
}

extension HabitEditViewController: UIPickerViewDataSource, UIPickerViewDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return CustomColor.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CustomColor.allValues[row].rawValue
    }
}

extension HabitEditViewController: ColorPickerDelegate {
    func colorPickerValueChanged(newColor:UIColor) {
        colorCircle.updateColor(color: newColor)
    }
}

extension HabitEditViewController: TimePickerDelegate {
    func timePickerValueChanged(newTime:NSAttributedString) {
        timeButton.setAttributedTitle(newTime, for: .normal)
    }
}

extension HabitEditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !colorPickerView.isHidden {
            colorPickerView.setIsHidden(true, animated: true)
        }
        if !timePickerView.isHidden {
            timePickerView.setIsHidden(true, animated: true)
        }
    }
}
