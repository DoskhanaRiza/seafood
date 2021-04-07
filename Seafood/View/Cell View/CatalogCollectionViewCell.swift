//
//  CatalogCollectionViewCell.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CatalogCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let catalogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let catalogNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.numberOfLines = 1
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    func setupViews() {
        
        contentView.addSubview(catalogImageView)
        contentView.addSubview(catalogNameLabel)
        
        catalogImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - 25)
//        catalogNameLabel.frame = CGRect(x: 10, y: contentView.frame.height - 20, width: contentView.frame.width, height: 20)
        catalogNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        catalogNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        catalogNameLabel.topAnchor.constraint(equalTo: catalogImageView.bottomAnchor, constant: 5).isActive = true
    }
    
    
}
