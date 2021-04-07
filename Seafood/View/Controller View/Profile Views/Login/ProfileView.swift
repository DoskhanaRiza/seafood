//
//  ProfileView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class ProfileView: UIView {
    
    //MARK: - Adding UI elements

    let loginContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let myAddressContainer: UIView = {
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

    let notificationsContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    let deliveryContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    let takeawayContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    let supplierContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    let contactsContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти в аккаунт", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let myAddressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Мои адреса", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        let addressImage = UIImage(named: "address")
        let tintedImage = addressImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.1356485445, green: 0.3509331966, blue: 0.7330752269, alpha: 1)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let shopAddressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Наши адреса", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        let shopImage = UIImage(named: "shop")
        let tintedImage = shopImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.1356485445, green: 0.3509331966, blue: 0.7330752269, alpha: 1)
        button.contentHorizontalAlignment = .left
        return button
    }()

    let notificationsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уведомления", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        let bellImage = UIImage(named: "bell")
        let tintedImage = bellImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.1356485445, green: 0.3509331966, blue: 0.7330752269, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()

    let deliveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Условия доставки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()

    let takeawayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Условия самовывоза", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()

    let supplierButton: UIButton = {
        let button = UIButton()
        button.setTitle("Поставщикам", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()

    let contactsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Контакты", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        return scrollView
    }()
    
    //MARK: - Init functions
    
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
    
    //MARK: - Setting up UI functions
    
    func setupViews() {

        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: 500)
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scrollView.addSubview(loginContainer)
        loginContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        loginContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        loginContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        loginContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginContainer.addSubview(loginButton)
        loginButton.centerYAnchor.constraint(equalTo: loginContainer.centerYAnchor).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: loginContainer.leadingAnchor, constant: 15).isActive = true
        loginButton.widthAnchor.constraint(equalTo: loginContainer.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalTo: loginContainer.heightAnchor).isActive = true
        
        scrollView.addSubview(myAddressContainer)
        myAddressContainer.topAnchor.constraint(equalTo: loginContainer.bottomAnchor, constant: 30).isActive = true
        myAddressContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myAddressContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myAddressContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        myAddressContainer.addSubview(myAddressButton)
        myAddressButton.centerYAnchor.constraint(equalTo: myAddressContainer.centerYAnchor).isActive = true
        myAddressButton.leadingAnchor.constraint(equalTo: myAddressContainer.leadingAnchor, constant: 15).isActive = true
        myAddressButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        myAddressButton.widthAnchor.constraint(equalTo: myAddressContainer.widthAnchor).isActive = true
        myAddressButton.heightAnchor.constraint(equalTo: myAddressContainer.heightAnchor).isActive = true
        
        scrollView.addSubview(addressContainer)
        addressContainer.topAnchor.constraint(equalTo: myAddressContainer.bottomAnchor, constant: 0.3).isActive = true
        addressContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addressContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        addressContainer.addSubview(shopAddressButton)
        shopAddressButton.centerYAnchor.constraint(equalTo: addressContainer.centerYAnchor).isActive = true
        shopAddressButton.leadingAnchor.constraint(equalTo: addressContainer.leadingAnchor, constant: 15).isActive = true
        shopAddressButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        shopAddressButton.widthAnchor.constraint(equalTo: addressContainer.widthAnchor).isActive = true
        shopAddressButton.heightAnchor.constraint(equalTo: addressContainer.heightAnchor).isActive = true

        scrollView.addSubview(notificationsContainer)
        notificationsContainer.topAnchor.constraint(equalTo: shopAddressButton.bottomAnchor,constant: 0.3).isActive = true
        notificationsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        notificationsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        notificationsContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        notificationsContainer.addSubview(notificationsButton)
        notificationsButton.centerYAnchor.constraint(equalTo: notificationsContainer.centerYAnchor).isActive = true
        notificationsButton.leadingAnchor.constraint(equalTo: notificationsContainer.leadingAnchor, constant: 15).isActive = true
        notificationsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        notificationsButton.widthAnchor.constraint(equalTo: notificationsContainer.widthAnchor).isActive = true
        notificationsButton.heightAnchor.constraint(equalTo: notificationsContainer.heightAnchor).isActive = true

        scrollView.addSubview(deliveryContainer)
        deliveryContainer.topAnchor.constraint(equalTo: notificationsContainer.bottomAnchor, constant: 15).isActive = true
        deliveryContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        deliveryContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        deliveryContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        deliveryContainer.addSubview(deliveryButton)
        deliveryButton.centerYAnchor.constraint(equalTo: deliveryContainer.centerYAnchor).isActive = true
        deliveryButton.leadingAnchor.constraint(equalTo: deliveryContainer.leadingAnchor, constant: 15).isActive = true
        deliveryButton.widthAnchor.constraint(equalTo: deliveryContainer.widthAnchor).isActive = true
        deliveryButton.heightAnchor.constraint(equalTo: deliveryContainer.heightAnchor).isActive = true

        scrollView.addSubview(takeawayContainer)
        takeawayContainer.topAnchor.constraint(equalTo: deliveryContainer.bottomAnchor, constant: 0.3).isActive = true
        takeawayContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        takeawayContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        takeawayContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        takeawayContainer.addSubview(takeawayButton)
        takeawayButton.centerYAnchor.constraint(equalTo: takeawayContainer.centerYAnchor).isActive = true
        takeawayButton.leadingAnchor.constraint(equalTo: takeawayContainer.leadingAnchor, constant: 15).isActive = true
        takeawayButton.widthAnchor.constraint(equalTo: takeawayContainer.widthAnchor).isActive = true
        takeawayButton.heightAnchor.constraint(equalTo: takeawayContainer.heightAnchor).isActive = true

        scrollView.addSubview(supplierContainer)
        supplierContainer.topAnchor.constraint(equalTo: takeawayContainer.bottomAnchor,constant: 0.3).isActive = true
        supplierContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        supplierContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        supplierContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        supplierContainer.addSubview(supplierButton)
        supplierButton.centerYAnchor.constraint(equalTo: supplierContainer.centerYAnchor).isActive = true
        supplierButton.leadingAnchor.constraint(equalTo: supplierContainer.leadingAnchor, constant: 15).isActive = true
        supplierButton.widthAnchor.constraint(equalTo: supplierContainer.widthAnchor).isActive = true
        supplierButton.heightAnchor.constraint(equalTo: supplierContainer.heightAnchor).isActive = true

        scrollView.addSubview(contactsContainer)
        contactsContainer.topAnchor.constraint(equalTo: supplierContainer.bottomAnchor, constant: 0.3).isActive = true
        contactsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contactsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contactsContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        contactsContainer.addSubview(contactsButton)
        contactsButton.centerYAnchor.constraint(equalTo: contactsContainer.centerYAnchor).isActive = true
        contactsButton.leadingAnchor.constraint(equalTo: contactsContainer.leadingAnchor, constant: 15).isActive = true
        contactsButton.widthAnchor.constraint(equalTo: contactsContainer.widthAnchor).isActive = true
        contactsButton.heightAnchor.constraint(equalTo: contactsContainer.heightAnchor).isActive = true

    }
}
