//
//  MyAddressTableViewCell.swift
//  Seafood
//
//  Created by Riza on 2/19/21.
//

import UIKit

class MyAddressTableViewCell: UITableViewCell {

    static let identifier = "MyAddressCell"

    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    let secondaryAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let addressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "shop")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addressLabel)
        contentView.addSubview(secondaryAddressLabel)
        contentView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        secondaryAddressLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10).isActive = true
        secondaryAddressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        secondaryAddressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
