//
//  HabitViewCell.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 10.11.2023.
//

import UIKit

/*
class HabitViewCell: UITableViewCell {
    // MARK: - Subviews

    let authorLabel: UILabel = {
        let label = UILabel()
        //label.textColor = UIColor.textColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize:20, weight: .bold)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
    }()
    
    // MARK: - Lifecycle

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, author: String, image: String, description: String, likes: Int, views: Int) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(author: author, image: image, description: description, likes: likes, views: views)
        setupConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(author: "Unknown", image: "notFound", description: "Unknown", likes: 0, views: 0)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews(author: "Unknown", image: "notFound", description: "Unknown", likes: 0, views: 0)
        setupConstraints()
    }
    
    // MARK: - Private

    private func addSubviews(author: String, image: String, description: String, likes: Int, views: Int) {
        contentView.addSubview(authorLabel)
        contentView.addSubview(authorProfilePicture)
        
        authorLabel.text = author
        authorProfilePicture.image = UIImage(named: author)
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
        ])
    }
}
*/
