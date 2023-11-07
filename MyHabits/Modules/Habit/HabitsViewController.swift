//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 03.11.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = UIColor(named: "electricViolet")
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        print("Add button tapped")
    }
}
