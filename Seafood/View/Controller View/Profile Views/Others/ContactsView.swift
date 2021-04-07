//
//  ExtensionContactsVC.swift
//  Seafood
//
//  Created by Riza on 2/26/21.
//

import UIKit

class ContactsView: UIView {
    
    //MARK: - Adding Views
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "ТЕЛЕФОНЫ"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellularContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let cellularLabel: UILabel = {
        let label = UILabel()
        label.text = "МОБИЛЬНЫЙ"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("8 700 545 00 00", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let phoneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "phone"), for: .normal)
        return button
    }()
    
    let whatsappContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let whatsappLabel: UILabel = {
        let label = UILabel()
        label.text = "WhatsApp"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let whatsappImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "whatsapp")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let whatsappPhoneNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("8 700 545 00 00", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let instagramContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instagramImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "instagram")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let instagramLinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("@moreprodukty.kz", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("87005450000@mail.ru", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let requisitesLabel: UILabel = {
        let label = UILabel()
        label.text = "РЕКВИЗИТЫ КОМПАНИИ"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let requisitesInfoContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Название организации"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let requisitesInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "EVA GROUP ИП\n840803301345 \n\nKZ08722S000003644182(KZT)\nCZSPKZKA\nAO 'KASPI' г. Алматы\nКБе 19 \n\nСвидетельство о гос. регистрации ИП Серия 6007\n# 0002033 \n\nг. Алматы, пр. Гагарина, 236Б"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let requisitesEmailLinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("87005450000@mail.ru", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        return scrollView
    }()
    
    //MARK: - Initializing Views
    
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
    
    
    //MARK: - Setting Views
    
    func setupViews() {
        
        self.backgroundColor = .gray
        
        let height: CGFloat = 120 * 4 + 350
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: height + 30)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: height + 30).isActive = true
        
        scrollView.addSubview(phoneLabel)
        phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        scrollView.addSubview(cellularContainer)
        cellularContainer.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 5).isActive = true
        cellularContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellularContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellularContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        cellularContainer.addSubview(cellularLabel)
        cellularLabel.topAnchor.constraint(equalTo: cellularContainer.topAnchor, constant: 30).isActive = true
        cellularLabel.leadingAnchor.constraint(equalTo: cellularContainer.leadingAnchor, constant: 15).isActive = true
        cellularLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        cellularContainer.addSubview(phoneNumberButton)
        phoneNumberButton.topAnchor.constraint(equalTo: cellularLabel.bottomAnchor, constant: 5).isActive = true
        phoneNumberButton.leadingAnchor.constraint(equalTo: cellularContainer.leadingAnchor).isActive = true
        phoneNumberButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        cellularContainer.addSubview(phoneButton)
        phoneButton.trailingAnchor.constraint(equalTo: cellularContainer.trailingAnchor, constant: -15).isActive = true
        phoneButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        phoneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        phoneButton.centerYAnchor.constraint(equalTo: cellularContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(whatsappContainer)
        whatsappContainer.topAnchor.constraint(equalTo: cellularContainer.bottomAnchor, constant: 0.5).isActive = true
        whatsappContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        whatsappContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        whatsappContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        whatsappContainer.addSubview(whatsappImageView)
        whatsappImageView.leadingAnchor.constraint(equalTo: whatsappContainer.leadingAnchor, constant: 15).isActive = true
        whatsappImageView.centerYAnchor.constraint(equalTo: whatsappContainer.centerYAnchor).isActive = true
        whatsappImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        whatsappImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whatsappContainer.addSubview(whatsappLabel)
        whatsappLabel.topAnchor.constraint(equalTo: whatsappContainer.topAnchor, constant: 30).isActive = true
        whatsappLabel.leadingAnchor.constraint(equalTo: whatsappImageView.trailingAnchor, constant: 15).isActive = true
        whatsappLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        whatsappContainer.addSubview(whatsappPhoneNumberButton)
        whatsappPhoneNumberButton.topAnchor.constraint(equalTo: whatsappLabel.bottomAnchor, constant: 5).isActive = true
        whatsappPhoneNumberButton.leadingAnchor.constraint(equalTo: whatsappImageView.trailingAnchor).isActive = true
        whatsappPhoneNumberButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        scrollView.addSubview(instagramContainer)
        instagramContainer.topAnchor.constraint(equalTo: whatsappContainer.bottomAnchor, constant: 0.5).isActive = true
        instagramContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        instagramContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        instagramContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        instagramContainer.addSubview(instagramImageView)
        instagramImageView.leadingAnchor.constraint(equalTo: instagramContainer.leadingAnchor, constant: 15).isActive = true
        instagramImageView.centerYAnchor.constraint(equalTo: instagramContainer.centerYAnchor).isActive = true
        instagramImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        instagramImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        instagramContainer.addSubview(instagramLabel)
        instagramLabel.topAnchor.constraint(equalTo: instagramContainer.topAnchor, constant: 30).isActive = true
        instagramLabel.leadingAnchor.constraint(equalTo: instagramImageView.trailingAnchor, constant: 15).isActive = true
        instagramLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        instagramContainer.addSubview(instagramLinkButton)
        instagramLinkButton.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 5).isActive = true
        instagramLinkButton.leadingAnchor.constraint(equalTo: instagramImageView.trailingAnchor, constant: 5).isActive = true
        instagramLinkButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        scrollView.addSubview(emailContainer)
        emailContainer.topAnchor.constraint(equalTo: instagramContainer.bottomAnchor, constant: 0.5).isActive = true
        emailContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        emailContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        emailContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        emailContainer.addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 30).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: 15).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        emailContainer.addSubview(emailLinkButton)
        emailLinkButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5).isActive = true
        emailLinkButton.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: -10).isActive = true
        emailLinkButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        scrollView.addSubview(requisitesLabel)
        requisitesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        requisitesLabel.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 30).isActive = true
        requisitesLabel.widthAnchor.constraint(equalTo: emailContainer.widthAnchor).isActive = true
        
        scrollView.addSubview(requisitesInfoContainer)
        requisitesInfoContainer.topAnchor.constraint(equalTo: requisitesLabel.bottomAnchor, constant: 5).isActive = true
        requisitesInfoContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        requisitesInfoContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        requisitesInfoContainer.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        requisitesInfoContainer.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: requisitesInfoContainer.leadingAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: requisitesInfoContainer.topAnchor, constant: 15).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        requisitesInfoContainer.addSubview(requisitesInfoLabel)
        requisitesInfoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        requisitesInfoLabel.leadingAnchor.constraint(equalTo: requisitesInfoContainer.leadingAnchor, constant: 15).isActive = true
        requisitesInfoLabel.trailingAnchor.constraint(equalTo: requisitesInfoContainer.trailingAnchor, constant: -10).isActive = true
        
        requisitesInfoContainer.addSubview(requisitesEmailLinkButton)
        requisitesEmailLinkButton.topAnchor.constraint(equalTo: requisitesInfoLabel.bottomAnchor, constant: 3).isActive = true
        requisitesEmailLinkButton.leadingAnchor.constraint(equalTo: requisitesInfoContainer.leadingAnchor, constant: -35).isActive = true
        requisitesEmailLinkButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    
    
    
 
}
