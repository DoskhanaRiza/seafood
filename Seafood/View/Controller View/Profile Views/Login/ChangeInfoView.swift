//
//  ChangeInfoView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class ChangeInfoView: UIView {
    
    //MARK: - Adding UI Elements
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        return button
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
    
    let cameraContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let cameraImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "camera")
        return view
    }()
    
    let changeButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let saveButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .medium
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        return scrollView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите имя"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите фамилию"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Фамилия"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let patronymicLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите отчество"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let patronymicTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Отчество"
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
    
    //MARK: - Setting up Functions
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: 700)
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

        scrollView.addSubview(cameraContainer)
        cameraContainer.leadingAnchor.constraint(equalTo: blueContainer.centerXAnchor, constant: 20).isActive = true
        cameraContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cameraContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cameraContainer.layer.cornerRadius = 25
        cameraContainer.topAnchor.constraint(equalTo: blueContainer.bottomAnchor, constant: 20).isActive = true
        
        cameraContainer.addSubview(cameraImageView)
        cameraImageView.centerYAnchor.constraint(equalTo: cameraContainer.centerYAnchor).isActive = true
        cameraImageView.centerXAnchor.constraint(equalTo: cameraContainer.centerXAnchor).isActive = true
        cameraImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cameraImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        scrollView.addSubview(changeButtonContainer)
        changeButtonContainer.topAnchor.constraint(equalTo: profileContainer.bottomAnchor, constant: 20).isActive = true
        changeButtonContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        changeButtonContainer.widthAnchor.constraint(equalToConstant: 140).isActive = true
        changeButtonContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        changeButtonContainer.addSubview(changeButton)
        changeButton.centerYAnchor.constraint(equalTo: changeButtonContainer.centerYAnchor).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: changeButtonContainer.centerXAnchor).isActive = true
        changeButton.widthAnchor.constraint(equalTo: changeButtonContainer.widthAnchor).isActive = true
        
        deleteButton.isHidden = true
        
        scrollView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: changeButtonContainer.bottomAnchor, constant: 40).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
        scrollView.addSubview(surnameLabel)
        surnameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        surnameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        surnameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        scrollView.addSubview(surnameTextField)
        surnameTextField.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 10).isActive = true
        surnameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        surnameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        surnameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(patronymicLabel)
        patronymicLabel.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 20).isActive = true
        patronymicLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        patronymicLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        scrollView.addSubview(patronymicTextField)
        patronymicTextField.topAnchor.constraint(equalTo: patronymicLabel.bottomAnchor, constant: 10).isActive = true
        patronymicTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        patronymicTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        patronymicTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    func setupProfileImagePickedView() {
        
        changeButtonContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        changeButtonContainer.widthAnchor.constraint(equalToConstant: 140).isActive = true
        changeButtonContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(deleteButton)
        deleteButton.isHidden = false
        deleteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: deleteButton.intrinsicContentSize.width).isActive = true
        deleteButton.topAnchor.constraint(equalTo: changeButtonContainer.bottomAnchor, constant: 5).isActive = true
        
    }
    
}
