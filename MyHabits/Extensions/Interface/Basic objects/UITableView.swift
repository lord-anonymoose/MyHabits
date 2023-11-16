//
//  UITableView.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

extension UITableView {
    func hideIndicators() {
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func habitsView(isHeaderHidden: Bool = false) -> UITableView {
        var tableView = UITableView()
        if isHeaderHidden {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.hideIndicators()
        tableView.sectionHeaderTopPadding = 0
        
        return tableView
    }
}
