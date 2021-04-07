//
//  MyAddress.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class MyAddressView: UIView {
    
    //MARK: - Setting Up empty views
    
    let emptyAddressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noaddress")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emptyAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Список адресов пуст"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondaryEmptyListLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы не добавили ни одного адреса"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupEmptyView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up UI
    
    func setupEmptyView() {
        
        self.addSubview(emptyAddressImageView)
        emptyAddressImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyAddressImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyAddressImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        emptyAddressImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(emptyAddressLabel)
        emptyAddressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyAddressLabel.topAnchor.constraint(equalTo: emptyAddressImageView.bottomAnchor, constant: 15).isActive = true
        emptyAddressLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        emptyAddressLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(secondaryEmptyListLabel)
        secondaryEmptyListLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondaryEmptyListLabel.topAnchor.constraint(equalTo: emptyAddressLabel.bottomAnchor, constant: 15).isActive = true
        secondaryEmptyListLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        secondaryEmptyListLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
}
