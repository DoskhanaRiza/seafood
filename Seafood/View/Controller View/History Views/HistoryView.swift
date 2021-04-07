//
//  HistoryView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class HistoryView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        return tableView
    }()
    
    let emptyBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "emptyBox")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emptyListLabel: UILabel = {
        let label = UILabel()
        label.text = "Список пуст"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let goToCatalogButton: UIButton = {
        let button = UIButton()
        button.setTitle("В каталог", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.style = .large
        activityView.translatesAutoresizingMaskIntoConstraints = false
        return activityView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        return scrollView
    }()
    
    //MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFilledViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up UI
    
    func setupEmptyView() {
        
        tableView.isHidden = true
        emptyBoxImageView.isHidden = false
        emptyListLabel.isHidden = false
        buttonContainer.isHidden = false
        goToCatalogButton.isHidden = false
        
        self.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        scrollView.addSubview(emptyBoxImageView)
        emptyBoxImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyBoxImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyBoxImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        emptyBoxImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(emptyListLabel)
        emptyListLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyListLabel.topAnchor.constraint(equalTo: emptyBoxImageView.bottomAnchor, constant: 15).isActive = true
        emptyListLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        emptyListLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(buttonContainer)
        buttonContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttonContainer.topAnchor.constraint(equalTo: emptyListLabel.bottomAnchor, constant: 15).isActive = true
        buttonContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        buttonContainer.addSubview(goToCatalogButton)
        goToCatalogButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor).isActive = true
        goToCatalogButton.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor).isActive = true
        goToCatalogButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor).isActive = true
        goToCatalogButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor).isActive = true
        
    }
    
    func setupFilledViews() {
        
        scrollView.isHidden = true
        emptyListLabel.isHidden = true
        emptyBoxImageView.isHidden = true
        goToCatalogButton.isHidden = true
        buttonContainer.isHidden = true
        tableView.isHidden = false
        
        self.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        
        activityView.startAnimating()
        self.addSubview(activityView)
        activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(tableView)
        
    }
    
}
