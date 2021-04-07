//
//  LoginView.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - Adding UI Elements
    
    let seafoodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "seafood")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход в аккаунт"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите телефон"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let otpTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let confirmButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()

    let confrimButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    //MARK: - Setting UP UI
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.06399380009, green: 0.02715566892, blue: 0.4435279187, alpha: 1)
        
        self.addSubview(seafoodImageView)
        seafoodImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        seafoodImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        seafoodImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        seafoodImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: seafoodImageView.bottomAnchor, constant: 15).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        loginLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        self.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.addSubview(phoneNumberTextField)
        phoneNumberTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8).isActive = true
        phoneNumberTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(confirmButtonContainer)
        confirmButtonContainer.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 50).isActive = true
        confirmButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        confirmButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        confirmButtonContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        confirmButtonContainer.addSubview(confrimButton)
        confrimButton.centerYAnchor.constraint(equalTo: confirmButtonContainer.centerYAnchor).isActive = true
        confrimButton.centerXAnchor.constraint(equalTo: confirmButtonContainer.centerXAnchor).isActive = true
        confrimButton.widthAnchor.constraint(equalTo: confirmButtonContainer.widthAnchor).isActive = true
        
        self.addSubview(cancelButton)
        cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: confirmButtonContainer.bottomAnchor, constant: 45).isActive = true
        
    }
    
   
    
}
