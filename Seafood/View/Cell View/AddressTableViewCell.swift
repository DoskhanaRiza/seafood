//
//  AddressTableViewCell.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    static let identifier = "AddressCell"

    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let secondaryAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let addressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addressLabel)
        contentView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(addressImageView)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addressImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        addressImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        addressImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        addressImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true

        addressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: addressImageView.leadingAnchor, constant: 20).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}
