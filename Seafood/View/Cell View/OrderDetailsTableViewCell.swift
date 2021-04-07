//
//  OrderDetailsTableViewCell.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class OrderDetailsTableViewCell: UITableViewCell {

    static let identifier = "OrderDetailsCell"
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    func addViews() {
        
        contentView.addSubview(foodImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(numberLabel)
        
        contentView.backgroundColor = .white
        
    }
    
    func setupViews() {

        foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        foodImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5).isActive = true
        
    }
    
    
    let foodImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "delivery")
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Креветки"
        label.numberOfLines = 0
        return label
    }()
        
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2500 тг /"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .left
        label.text = "1 шт"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

}
