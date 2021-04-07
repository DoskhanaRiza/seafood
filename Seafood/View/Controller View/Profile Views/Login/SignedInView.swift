//
//  SignedInView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class SignedInView: UIView {
    
    //MARK: - Adding views
    
   let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let blueContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let profileContainer: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.borderWidth = 3
        container.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        return container
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        imageView.image = UIImage(named: "contact")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Не указано"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let phoneLabelContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let phoneImageView: UIView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "phone")
        return imageView
    }()
    
    let emailLabelContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let emailImageView: UIView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "email")
        return imageView
    }()
    
    let phoneNumberContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editPhoneNumberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        button.clipsToBounds = true
        button.backgroundColor = .white
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
        label.text = "Не указано"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editEmailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        button.backgroundColor = .white
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        return scrollView
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Init Functios
    
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
    
    //MARK: - Setting up Function
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: 600)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        scrollView.addSubview(blueContainer)
        blueContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        blueContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blueContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        blueContainer.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        scrollView.addSubview(profileContainer)
        profileContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileContainer.centerYAnchor.constraint(equalTo: blueContainer.bottomAnchor).isActive = true
        profileContainer.widthAnchor.constraint(equalToConstant: 140).isActive = true
        profileContainer.heightAnchor.constraint(equalToConstant: 140).isActive = true
        profileContainer.layer.cornerRadius = 70
        
        profileContainer.addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo: profileContainer.centerYAnchor).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: profileContainer.centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: profileContainer.bottomAnchor, constant: 30).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(changeButtonContainer)
        changeButtonContainer.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        changeButtonContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        changeButtonContainer.widthAnchor.constraint(equalToConstant: 140).isActive = true
        changeButtonContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true

        changeButtonContainer.addSubview(changeButton)
        changeButton.centerYAnchor.constraint(equalTo: changeButtonContainer.centerYAnchor).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: changeButtonContainer.centerXAnchor).isActive = true
        changeButton.widthAnchor.constraint(equalTo: changeButtonContainer.widthAnchor).isActive = true
        
        scrollView.addSubview(phoneLabelContainer)
        phoneLabelContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        phoneLabelContainer.topAnchor.constraint(equalTo: changeButtonContainer.bottomAnchor, constant: 20).isActive = true
        phoneLabelContainer.widthAnchor.constraint(equalToConstant: 30).isActive = true
        phoneLabelContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        phoneLabelContainer.addSubview(phoneImageView)
        phoneImageView.centerYAnchor.constraint(equalTo: phoneLabelContainer.centerYAnchor).isActive = true
        phoneImageView.centerXAnchor.constraint(equalTo: phoneLabelContainer.centerXAnchor).isActive = true
        phoneImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        phoneImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        scrollView.addSubview(phoneNumberContainer)
        phoneNumberContainer.topAnchor.constraint(equalTo: changeButtonContainer.bottomAnchor, constant: 20).isActive = true
        phoneNumberContainer.leadingAnchor.constraint(equalTo: phoneLabelContainer.trailingAnchor, constant: 0.5).isActive = true
        phoneNumberContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        phoneNumberContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        phoneNumberContainer.addSubview(phoneNumberLabel)
        phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberContainer.leadingAnchor, constant: 15).isActive = true
        phoneNumberLabel.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(editPhoneNumberButton)
        editPhoneNumberButton.centerYAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor).isActive = true
        editPhoneNumberButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        editPhoneNumberButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        editPhoneNumberButton.trailingAnchor.constraint(equalTo: phoneNumberContainer.trailingAnchor, constant: -25).isActive = true
        editPhoneNumberButton.layer.cornerRadius = 20
        
        scrollView.addSubview(emailLabelContainer)
        emailLabelContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        emailLabelContainer.topAnchor.constraint(equalTo: phoneLabelContainer.bottomAnchor, constant: 30).isActive = true
        emailLabelContainer.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emailLabelContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true

        emailLabelContainer.addSubview(emailImageView)
        emailImageView.centerYAnchor.constraint(equalTo: emailLabelContainer.centerYAnchor).isActive = true
        emailImageView.centerXAnchor.constraint(equalTo: emailLabelContainer.centerXAnchor).isActive = true
        emailImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        emailImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        scrollView.addSubview(emailContainer)
        emailContainer.topAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor, constant: 30).isActive = true
        emailContainer.leadingAnchor.constraint(equalTo: emailLabelContainer.trailingAnchor, constant: 0.5).isActive = true
        emailContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        emailContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        emailContainer.addSubview(emailLabel)
        emailLabel.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: 15).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: emailContainer.centerYAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        scrollView.addSubview(editEmailButton)
        editEmailButton.centerYAnchor.constraint(equalTo: emailContainer.bottomAnchor).isActive = true
        editEmailButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        editEmailButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        editEmailButton.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor, constant: -25).isActive = true
        editEmailButton.layer.cornerRadius = 20
        
        scrollView.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: editEmailButton.bottomAnchor, constant: 15).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        tableView.isScrollEnabled = false
        
    }

    
}
