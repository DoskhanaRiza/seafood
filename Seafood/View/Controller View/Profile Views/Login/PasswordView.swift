//
//  PasswordView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class PasswordView: UIView {
    
    //MARK: - Adding UI Elements
    
    let seafoodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "seafood")?.withRenderingMode(.alwaysTemplate)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.tintColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
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
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите пароль"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let enterButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()

    let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
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
    
    //MARK: - Setting up UI
    
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
        
        self.addSubview(passwordLabel)
        passwordLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(forgetPasswordButton)
        forgetPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15).isActive = true
        forgetPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        forgetPasswordButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(enterButtonContainer)
        enterButtonContainer.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: 50).isActive = true
        enterButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        enterButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        enterButtonContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        enterButtonContainer.addSubview(enterButton)
        enterButton.centerYAnchor.constraint(equalTo: enterButtonContainer.centerYAnchor).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: enterButtonContainer.centerXAnchor).isActive = true
        enterButton.widthAnchor.constraint(equalTo: enterButtonContainer.widthAnchor).isActive = true

        self.addSubview(cancelButton)
        cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: enterButtonContainer.bottomAnchor, constant: 45).isActive = true
        
    }
    
    
    
}
