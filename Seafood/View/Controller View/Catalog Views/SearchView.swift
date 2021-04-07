//
//  SearchView.swift
//  Seafood
//
//  Created by Riza on 3/15/21.
//

import UIKit

class SearchView: UIView {

    //MARK: - Adding UI elements
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let searchLabel: UILabel = {
       let label = UILabel()
        label.text = "ВЫ НЕДАВНО ИСКАЛИ"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seacrhTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Название или артикул"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .white
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        return tf
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
        
        self.backgroundColor = .white
        
        
        self.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 98).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    
        seacrhTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        seacrhTextField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        tableView.addSubview(searchLabel)
        
    }
    
    
}
