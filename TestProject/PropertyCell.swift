//
//  PropertyCell.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/18/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

class PropertyCell: UITableViewCell {
    
    // MARK: - Properties
    var result: Property? {
        didSet {
            configure()
        }
    }
    
    private let viewFrame: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img-1")
        imageView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amauntLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let noLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightViewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "star-outline"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(favoriteHandler(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Actions
    @objc func favoriteHandler(_ sender: UIButton) {
        print(#function)
    }
}

// MARK: - Configuration
private extension PropertyCell {
    func configure() {
        
        guard let result = result else { return }
        
        titleLabel.text = result.name
        locationLabel.text = result.location
        amauntLabel.text = result.amount
        noLabel.text = result.no
    }
    
    func configureConstraints() {
        [viewFrame, iconImageView, titleLabel, locationLabel, amauntLabel, rightViewSeparator, favoriteButton, noLabel].forEach { addSubview($0)}
        
        NSLayoutConstraint.activate([
            viewFrame.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewFrame.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewFrame.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            viewFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            
            iconImageView.centerYAnchor.constraint(equalTo: viewFrame.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: viewFrame.leadingAnchor, constant: 8),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            
            rightViewSeparator.topAnchor.constraint(equalTo: viewFrame.topAnchor, constant: 0),
            rightViewSeparator.bottomAnchor.constraint(equalTo: viewFrame.bottomAnchor, constant: 0),
            rightViewSeparator.trailingAnchor.constraint(equalTo: viewFrame.trailingAnchor, constant: -50),
            rightViewSeparator.widthAnchor.constraint(equalToConstant: 2),
            
            favoriteButton.centerYAnchor.constraint(equalTo: viewFrame.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: viewFrame.trailingAnchor, constant: -20),
            
            locationLabel.centerYAnchor.constraint(equalTo: viewFrame.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            locationLabel.trailingAnchor.constraint(equalTo: rightViewSeparator.trailingAnchor, constant: -4),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: rightViewSeparator.trailingAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -3),
            
            amauntLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            amauntLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            amauntLabel.trailingAnchor.constraint(equalTo: rightViewSeparator.trailingAnchor, constant: -4),
            
            noLabel.topAnchor.constraint(equalTo: amauntLabel.bottomAnchor, constant: 8),
            noLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            noLabel.trailingAnchor.constraint(equalTo: rightViewSeparator.trailingAnchor, constant: -4)
        ])
    }
}

