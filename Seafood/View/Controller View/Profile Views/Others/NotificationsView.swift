//
//  NotificationsView.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class NotificationsView: UIView {
        
    //MARK: - Adding UI
    
    let emptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "emptyBox")
        return imageView
    }()
    
    let emptyLabel: UILabel = {
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
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up UI
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        
        self.addSubview(emptyImageView)
        emptyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        emptyImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(emptyLabel)
        emptyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 15).isActive = true
        emptyLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        emptyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
   
    
}
