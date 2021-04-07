//
//  ShopAddressDetails.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class ShopAddressDetailsView: UIView {
    
    //MARK: - Adding UI
    
    let shopLabel: UILabel = {
        let label = UILabel()
        label.text = "Морепродукты КЗ"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shopDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Точка самовывоза\n\nОткрыто"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "АДРЕС"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "г. Алматы, пр. Гагарина, 236Б"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scheduleLabel: UILabel = {
        let label = UILabel()
        label.text = "ГРАФИК РАБОТЫ"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scheduleDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Понедельник - Воскресенье\n\n10:00 - 20:00"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shopContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let shopDetailsContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let addressContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let addressDetailsContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let scheduleContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let scheduleDetailsContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
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

        self.addSubview(shopContainer)
        shopContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        shopContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        shopContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        shopContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.addSubview(shopDetailsContainer)
        shopDetailsContainer.topAnchor.constraint(equalTo: shopContainer.bottomAnchor, constant: 0.3).isActive = true
        shopDetailsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        shopDetailsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        shopDetailsContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        shopContainer.addSubview(shopLabel)
        shopLabel.centerYAnchor.constraint(equalTo: shopContainer.centerYAnchor).isActive = true
        shopLabel.leadingAnchor.constraint(equalTo: shopContainer.leadingAnchor, constant: 15).isActive = true
        shopLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        shopDetailsContainer.addSubview(shopDetailsLabel)
        shopDetailsLabel.centerYAnchor.constraint(equalTo: shopDetailsContainer.centerYAnchor).isActive = true
        shopDetailsLabel.leadingAnchor.constraint(equalTo: shopDetailsContainer.leadingAnchor, constant: 15).isActive = true
        shopDetailsLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: shopDetailsContainer.bottomAnchor, constant: 25).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(addressDetailsContainer)
        addressDetailsContainer.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 15).isActive = true
        addressDetailsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressDetailsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addressDetailsContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addressDetailsContainer.addSubview(addressDetailsLabel)
        addressDetailsLabel.centerYAnchor.constraint(equalTo: addressDetailsContainer.centerYAnchor).isActive = true
        addressDetailsLabel.leadingAnchor.constraint(equalTo: addressDetailsContainer.leadingAnchor, constant: 15).isActive = true
        addressDetailsLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(scheduleLabel)
        scheduleLabel.centerYAnchor.constraint(equalTo: addressDetailsContainer.bottomAnchor, constant: 30).isActive = true
        scheduleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        scheduleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.addSubview(scheduleDetailsContainer)
        scheduleDetailsContainer.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: 15).isActive = true
        scheduleDetailsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scheduleDetailsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scheduleDetailsContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        scheduleDetailsContainer.addSubview(scheduleDetailsLabel)
        scheduleDetailsLabel.centerYAnchor.constraint(equalTo: scheduleDetailsContainer.centerYAnchor).isActive = true
        scheduleDetailsLabel.leadingAnchor.constraint(equalTo: scheduleDetailsContainer.leadingAnchor, constant: 15).isActive = true
        scheduleDetailsLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        
        
        
        
        
    }
    
}
