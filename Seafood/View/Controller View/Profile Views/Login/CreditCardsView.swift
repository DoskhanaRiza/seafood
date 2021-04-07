//
//  CreditCardsView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class CreditCardsView: UIView {
    
    //MARK: - Adding Views
    
    let emptyBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "emptyBox")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emptyListLabel: UILabel = {
        let label = UILabel()
        label.text = "Список пуст"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setEmptyView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up Function
    
    func setEmptyView() {
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)

        self.addSubview(emptyBoxImageView)
        emptyBoxImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyBoxImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyBoxImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        emptyBoxImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(emptyListLabel)
        emptyListLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyListLabel.topAnchor.constraint(equalTo: emptyBoxImageView.bottomAnchor, constant: 15).isActive = true
        emptyListLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        emptyListLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}


