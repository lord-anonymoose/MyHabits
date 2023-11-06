//
//  HabitCreateViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 07.11.2023.
//

import UIKit

class HabitCreateViewController: UIViewController {
    
    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Color"
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        addSubviews()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Create a habit"
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        
        navigationItem.rightBarButtonItems = [saveButton]
        navigationItem.leftBarButtonItems = [cancelButton]
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        print("Save button tapped")
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        print("Cancel button tapped")
    }
}
