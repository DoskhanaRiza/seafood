//
//  ChangePasswordView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class ChangePasswordView: UIView {
    
    
    //MARK: - Adding UI Elements
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let oldPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Старый пароль"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let oldPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите старый пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let newPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый пароль"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите новый пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let repeatNewPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Повторите новый пароль"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatNewPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Повторите новый пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
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
    
    //MARK: - Setting up UI Functions
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)

        self.addSubview(oldPasswordLabel)
        oldPasswordLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 140).isActive = true
        oldPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        oldPasswordLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(oldPasswordTextField)
        oldPasswordTextField.topAnchor.constraint(equalTo: oldPasswordLabel.bottomAnchor, constant: 10).isActive = true
        oldPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        oldPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        oldPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(newPasswordLabel)
        newPasswordLabel.topAnchor.constraint(equalTo: oldPasswordTextField.bottomAnchor, constant: 20).isActive = true
        newPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        newPasswordLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(newPasswordTextField)
        newPasswordTextField.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: 10).isActive = true
        newPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        newPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        newPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(repeatNewPasswordLabel)
        repeatNewPasswordLabel.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 20).isActive = true
        repeatNewPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        repeatNewPasswordLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(repeatNewPasswordTextField)
        repeatNewPasswordTextField.topAnchor.constraint(equalTo: repeatNewPasswordLabel.bottomAnchor, constant: 10).isActive = true
        repeatNewPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        repeatNewPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        repeatNewPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
}
