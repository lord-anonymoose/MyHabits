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
        label.textColor = UIColor(named: "textColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let textView: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: appInfo)
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .justified
        label.textColor = UIColor(named: "textColor")
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private let linkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        

        let firstAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? .label ]
        let firstString = NSAttributedString(string: "Source: ", attributes: firstAttribute)

        let secondAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.link, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let secondString = NSAttributedString(string: "www.activeiron.com", attributes: secondAttribute)

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

    // MARK: - Actions
    
    @IBAction func didTapSourceLink(sender: AnyObject) {
        if let url = URL(string: "https://www.activeiron.com/blog/the-21-90-rule-make-life-better/#:~:text=The%2021%2F90%20rule%20states,a%20part%20of%20your%20lifestyle") {
            if #available(iOS 10, *){
                UIApplication.shared.open(url)
            }else{
                UIApplication.shared.openURL(url)
            }
            
        }
    }

    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .systemBackground
        overrideUserInterfaceStyle = .light
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleView)
        contentView.addSubview(textView)
        contentView.addSubview(linkButton)
        linkButton.addTarget(self, action: #selector(didTapSourceLink), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeAreaGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
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
