//
//  PasswordRestoreView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class PasswordRestoreView: UIView {
    
    //MARK: - Adding UI Elements
    
    let seafoodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "seafood")?.withRenderingMode(.alwaysTemplate)
        imageView.backgroundColor = .white
        imageView.tintColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let passwordRestoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Восстановление пароля"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = .white
        label.numberOfLines = 2
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
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "8-747-116-57-40"
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
        textField.placeholder = " Введите Пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Повторите пароль"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Повторите Пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let codeConfirmLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите код подтверждения"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let codeConfirmTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Код подтверждения"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()

    let SMSLabel: UILabel = {
        let label = UILabel()
        label.text = "Для подтверждения на ваш номер\n  телефона был выслан СМС-код"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sendAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить еще раз", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let setPasswordButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    let setPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Установить пароль", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.06399380009, green: 0.02715566892, blue: 0.4435279187, alpha: 1)
        return scrollView
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
        
        self.backgroundColor = #colorLiteral(red: 0.06399380009, green: 0.02715566892, blue: 0.4435279187, alpha: 1)
        
        let height: CGFloat = 120 * 4 + 450
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: height)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: height + 30).isActive = true
        
        scrollView.addSubview(seafoodImageView)
        seafoodImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        seafoodImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        seafoodImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        seafoodImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        scrollView.addSubview(passwordRestoreLabel)
        passwordRestoreLabel.topAnchor.constraint(equalTo: seafoodImageView.bottomAnchor, constant: 15).isActive = true
        passwordRestoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        passwordRestoreLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        scrollView.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: passwordRestoreLabel.bottomAnchor, constant: 30).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.addSubview(phoneNumberLabel)
        phoneNumberLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        scrollView.addSubview(passwordLabel)
        passwordLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        scrollView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(repeatPasswordLabel)
        repeatPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        repeatPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        repeatPasswordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        scrollView.addSubview(repeatPasswordTextField)
        repeatPasswordTextField.topAnchor.constraint(equalTo: repeatPasswordLabel.bottomAnchor, constant: 8).isActive = true
        repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(codeConfirmLabel)
        codeConfirmLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 50).isActive = true
        codeConfirmLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        codeConfirmLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        scrollView.addSubview(codeConfirmTextField)
        codeConfirmTextField.topAnchor.constraint(equalTo: codeConfirmLabel.bottomAnchor, constant: 8).isActive = true
        codeConfirmTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        codeConfirmTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        codeConfirmTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(SMSLabel)
        SMSLabel.topAnchor.constraint(equalTo: codeConfirmTextField.bottomAnchor, constant: 40).isActive = true
        SMSLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
        SMSLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        SMSLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        scrollView.addSubview(sendAgainButton)
        sendAgainButton.topAnchor.constraint(equalTo: SMSLabel.bottomAnchor, constant: 30).isActive = true
        sendAgainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sendAgainButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        scrollView.addSubview(setPasswordButtonContainer)
        setPasswordButtonContainer.topAnchor.constraint(equalTo: sendAgainButton.bottomAnchor, constant: 35).isActive = true
        setPasswordButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        setPasswordButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        setPasswordButtonContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(setPasswordButton)
        setPasswordButton.centerYAnchor.constraint(equalTo: setPasswordButtonContainer.centerYAnchor).isActive = true
        setPasswordButton.centerXAnchor.constraint(equalTo: setPasswordButtonContainer.centerXAnchor).isActive = true
        
        scrollView.addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: setPasswordButtonContainer.bottomAnchor, constant: 30).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        
    }
    
    
}
