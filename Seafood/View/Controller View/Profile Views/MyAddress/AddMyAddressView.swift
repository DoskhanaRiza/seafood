//
//  AddMyAddressView.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class AddMyAddressView: UIView {
    
    //MARK: - Setting up Views
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MyAddressTableViewCell.self, forCellReuseIdentifier: MyAddressTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Например, работа"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Улица, проспект, микрорайон"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let streetTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Улица, проспект, микрорайон"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Дом"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let homeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер дома"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let apartmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Квартира/Офис"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let apartmentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Квартира/Офис"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let entranceLabel: UILabel = {
        let label = UILabel()
        label.text = "Подъезд"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let entranceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Подъезд"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let floorLabel: UILabel = {
        let label = UILabel()
        label.text = "Этаж"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let floorTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Этаж"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let intercomLabel: UILabel = {
        let label = UILabel()
        label.text = "Домофон"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let intercomTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Домофон"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()

    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    //MARK: - Setting up UI
    
    func setupViews() {
                
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: 800)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        scrollView.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(addressTextField)
        addressTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10).isActive = true
        addressTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        addressTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: addressTextField.bottomAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        tableView.isScrollEnabled = false
        
        scrollView.addSubview(streetLabel)
        streetLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        streetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        streetLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        scrollView.addSubview(streetTextField)
        streetTextField.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 10).isActive = true
        streetTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        streetTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        streetTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(homeLabel)
        homeLabel.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 20).isActive = true
        homeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        homeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true

        scrollView.addSubview(homeTextField)
        homeTextField.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 10).isActive = true
        homeTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        homeTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        homeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(apartmentLabel)
        apartmentLabel.topAnchor.constraint(equalTo: homeTextField.bottomAnchor, constant: 20).isActive = true
        apartmentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        apartmentLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(apartmentTextField)
        apartmentTextField.topAnchor.constraint(equalTo: apartmentLabel.bottomAnchor, constant: 10).isActive = true
        apartmentTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        apartmentTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        apartmentTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(entranceLabel)
        entranceLabel.topAnchor.constraint(equalTo: apartmentTextField.bottomAnchor, constant: 20).isActive = true
        entranceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        entranceLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(entranceTextField)
        entranceTextField.topAnchor.constraint(equalTo: entranceLabel.bottomAnchor, constant: 10).isActive = true
        entranceTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        entranceTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        entranceTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(floorLabel)
        floorLabel.topAnchor.constraint(equalTo: entranceTextField.bottomAnchor, constant: 20).isActive = true
        floorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        floorLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(floorTextField)
        floorTextField.topAnchor.constraint(equalTo: floorLabel.bottomAnchor, constant: 10).isActive = true
        floorTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        floorTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        floorTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(intercomLabel)
        intercomLabel.topAnchor.constraint(equalTo: floorTextField.bottomAnchor, constant: 20).isActive = true
        intercomLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        intercomLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(intercomTextField)
        intercomTextField.topAnchor.constraint(equalTo: intercomLabel.bottomAnchor, constant: 10).isActive = true
        intercomTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        intercomTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        intercomTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
   
    
}
