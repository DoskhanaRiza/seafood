//
//  SearchTableViewCell.swift
//  Seafood
//
//  Created by Riza on 2/22/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let identifier = "SearchCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(searchImageView)
        contentView.addSubview(searchStringLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        searchImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        searchImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        searchImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        searchImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        searchStringLabel.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 15).isActive = true
        searchStringLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.backgroundColor = .white
        contentView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let searchImage = UIImage(named: "search")
        let tintedImage = searchImage?.withRenderingMode(.alwaysTemplate)
        imageView.image = tintedImage
        imageView.tintColor = #colorLiteral(red: 0.1356485445, green: 0.3509331966, blue: 0.7330752269, alpha: 1)
        return imageView
    }()
    
    let searchStringLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
}
