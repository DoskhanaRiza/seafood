//
//  ProfileTableViewCell.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileCell"

    let settingsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondarySettingsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(settingsLabel)
        contentView.addSubview(iconImageView)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        settingsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        settingsLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 25).isActive = true
        settingsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true

        
        

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        settingsLabel.text = nil
        iconImageView.image = nil
    }
    
}

