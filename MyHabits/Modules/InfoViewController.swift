//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 03.11.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - Subviews

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.isUserInteractionEnabled = true

        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.isUserInteractionEnabled = true
        
        return contentView
    }()
    
    private let titleView: UILabel = {
        
        let label = UILabel()
        
        label.text = "A habit in 21 days"
        label.font = .boldSystemFont(ofSize: 20)

        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let textView: UILabel = {
        let view = UILabel()
        
        let string = """
Build a habit and make it a permanent lifestyle change.
\nThe 21/90 rule states that it takes 21 days to make a habit and 90 days to make it a permanent lifestyle change.
\nIs there a new lifestyle change you would like to make? Commit to your goal for 21 days and it will become a habit. Commit to your goal for 90 days and it will become a part of your lifestyle. Are you ready to make some positive changes? Here are some tips to help you keep your momentum.
\nRemember: 21 days to build a habit / 90 days to make it a permanent lifestyle change
\n1) Set your goal
\nDecide what you want to accomplish or change. This could be a personal or professional goal. Write it down in your planner or keep it on your laptop. Make sure it is visible to you so you can remain present and focused on your goal. Don’t be afraid of starting from the beginning, everyone must pass GO!
\n2) Make a plan
\nPlan out the steps you intend to take to reach your goal. If your goal is being more active, you might decide to try three new activities this week or plan on calling your friend who often goes running. Setting out times and dates are helpful ways to set yourself up for success and will help you to build habits. Making plans with people who share your goal is a sure way to stay motivated.
\n3) Focus
\nKeep it focused, you can’t do EVERYTHING. Focus on building one small habit at a time, the rest will follow.
\n4) Commit
\nYou need to stay committed to your goal if you want to build a habit and eventually change your lifestyle. The 21/90 rule only works if you consistently stick to your plan, the days must be consecutive. If you think you’ll have trouble committing, set boundaries. For example, if you need to take a day off make sure you don’t miss two in a row.
\n5) Repeat
\nRinse and repeat! The 21/90 rule can be used again and again to achieve your goals, build habits and change your lifestyle. Start small but think big.
"""
        let attributedString = NSMutableAttributedString(string: string)
        view.attributedText = attributedString
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.sizeToFit()
        view.textAlignment = .justified
        
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let linkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        

        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Source: ", attributes: firstAttribute)

        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.link, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let secondString = NSAttributedString(string: "www.link.com", attributes: secondAttribute)


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
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = contentView.frame.size
    }

    
    // MARK: - Private

    private func setupUI() {
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleView)
        contentView.addSubview(textView)
        contentView.addSubview(linkButton)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeAreaGuide.widthAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                        
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16),
            
            linkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            linkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            linkButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16),
            linkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}
