//
//  ViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 03.11.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.tabBar.backgroundColor = .systemGray6
        self.tabBar.tintColor = UIColor(named: "electricViolet") ?? .blue
        
        let habitsNavigationController = UINavigationController(rootViewController: HabitCreateViewController())
        //habitsNavigationController.navigationBar.prefersLargeTitles = true
        habitsNavigationController.topViewController?.title = "Today"
        habitsNavigationController.tabBarItem = UITabBarItem(title: "Habits", image: UIImage(systemName: "rectangle.grid.1x2.fill"), tag: 0)
        
        let infoNavigationController = UINavigationController(rootViewController: InfoViewController())
        infoNavigationController.navigationBar.prefersLargeTitles = false
        infoNavigationController.topViewController?.title = "Info"
        infoNavigationController.tabBarItem = UITabBarItem(title: "Habits", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        
        self.viewControllers = [
            habitsNavigationController,
            infoNavigationController
        ]
        
        let navigationBars = [
            habitsNavigationController.navigationBar,
            infoNavigationController.navigationBar
        ]
        
        for navigationBar in navigationBars {
            let bottomBorder = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1 + (navigationBar.prefersLargeTitles ? 50 : 0), width: navigationBar.frame.size.width, height: 0.5))
            bottomBorder.backgroundColor = UIColor.lightGray
            navigationBar.addSubview(bottomBorder)
        }
    }

}

