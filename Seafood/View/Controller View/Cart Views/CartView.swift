//
//  CartView.swift
//  Seafood
//
//  Created by Riza on 3/12/21.
//

import UIKit

class CartView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - View when list is empty
    
    let goToCatalogButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать из каталога", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
//        button.addTarget(self, action: #selector(goToCatalog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.2642597171, green: 0.4785630251, blue: 1, alpha: 1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let emptyCartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "emptyCart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emptyCartLabel: UILabel = {
        let label = UILabel()
        label.text = "В корзине пусто"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы не добавили ни одного товара"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Views when list isn't empty
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        return scrollView
    }()
    
    let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.style = .large
        activityView.translatesAutoresizingMaskIntoConstraints = false
        return activityView
    }()
    
    let sumTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Сумма заказа"
        label.numberOfLines = 1
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 1
        return label
    }()
    
    let walletImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallet")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let sumDetailsContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        return container
    }()
    
    let walletImageViewContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        return container
    }()
    
    let productsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "ТОВАРОВ:"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let productsCountNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let checkoutButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let navigationController = UINavigationController()
    var topBarHeight: CGFloat {
        var top = navigationController.navigationBar.frame.height
        if #available(iOS 13.0, *) {
            top += UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            top += UIApplication.shared.statusBarFrame.height
        }
        return top
    }
    
    let tabBarController = UITabBarController()
    
    //MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up empty view Function
    
    func setupEmptyView() {
        
        let tabBarHeight = tabBarController.tabBar.frame.height
        
        var bottom: CGFloat = 0
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            let bottomPadding = window.safeAreaInsets.bottom
            bottom = bottomPadding
        }
        
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        
        sumLabel.isHidden = true
        sumTextLabel.isHidden = true
        sumDetailsContainer.isHidden = true
        productsCountLabel.isHidden = true
        walletImageView.isHidden = true
        walletImageViewContainer.isHidden = true
        tableView.isHidden = true
        checkoutButtonContainer.isHidden = true
        
        buttonContainer.isHidden = false
        goToCatalogButton.isHidden = false
        emptyCartImageView.isHidden = false
        emptyCartLabel.isHidden = false
        secondaryLabel.isHidden = false
        
        self.addSubview(buttonContainer)
        buttonContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(tabBarHeight + bottom)).isActive = true
        buttonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        buttonContainer.heightAnchor.constraint(equalToConstant: tabBarHeight * 2 - bottom).isActive = true
        buttonContainer.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        buttonContainer.addSubview(goToCatalogButton)
        goToCatalogButton.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor).isActive = true
        goToCatalogButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor).isActive = true
        goToCatalogButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor).isActive = true
        goToCatalogButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor).isActive = true
        
        self.addSubview(emptyCartImageView)
        emptyCartImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyCartImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyCartImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        emptyCartImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(emptyCartLabel)
        emptyCartLabel.topAnchor.constraint(equalTo: emptyCartImageView.bottomAnchor, constant: 15).isActive = true
        emptyCartLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyCartLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        emptyCartLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(secondaryLabel)
        secondaryLabel.topAnchor.constraint(equalTo: emptyCartLabel.bottomAnchor, constant: 15).isActive = true
        secondaryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondaryLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondaryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
    
    }
    
    //MARK: - Setting up filled view function
    
    func setupFilledView() {
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width
        let height = screenSize.height
        
        let tabBarHeight = tabBarController.tabBar.frame.height
        
        var bottom: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            let bottomPadding = window.safeAreaInsets.bottom
            bottom = bottomPadding
        }
        
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        
        buttonContainer.isHidden = true
        goToCatalogButton.isHidden = true
        emptyCartImageView.isHidden = true
        emptyCartLabel.isHidden = true
        secondaryLabel.isHidden = true
                
        sumDetailsContainer.isHidden = false
        productsCountNumberLabel.isHidden = false
        walletImageViewContainer.isHidden = false
        tableView.isHidden = false
        productsCountLabel.isHidden = false
        activityView.isHidden = false
        sumTextLabel.isHidden = false
        sumLabel.isHidden = false
        walletImageView.isHidden = false
        checkoutButtonContainer.isHidden = false
        checkoutButton.isHidden = false
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: width, height: height)
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        scrollView.addSubview(sumDetailsContainer)
        sumDetailsContainer.frame = CGRect(x: 61, y: 0, width: self.frame.width, height: 80)
        
        sumDetailsContainer.addSubview(sumTextLabel)
        sumTextLabel.frame = CGRect(x: 20, y: 20, width: 100, height: 12)

        sumDetailsContainer.addSubview(sumLabel)
        sumLabel.frame = CGRect(x: 20, y: 40, width: self.frame.width - walletImageViewContainer.frame.width - 20, height: 24)

        scrollView.addSubview(productsCountNumberLabel)
        productsCountNumberLabel.frame = CGRect(x: self.frame.width - 40, y: 5, width: 40, height: productsCountNumberLabel.intrinsicContentSize.height)

        scrollView.addSubview(walletImageViewContainer)
        walletImageViewContainer.frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        
        walletImageViewContainer.addSubview(walletImageView)
        walletImageView.frame = CGRect(x: 20, y: 30, width: 25, height: 25)
        
        scrollView.addSubview(tableView)
        tableView.addSubview(productsCountLabel)
        productsCountLabel.frame = CGRect(x: self.frame.width - 140,
                                          y: 5,
                                          width: productsCountLabel.intrinsicContentSize.width,
                                          height: productsCountLabel.intrinsicContentSize.height)

        tableView.addSubview(productsCountNumberLabel)
        tableView.alwaysBounceVertical = false
        
        activityView.startAnimating()
        self.addSubview(activityView)
        activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        scrollView.addSubview(checkoutButtonContainer)
        checkoutButtonContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(tabBarHeight + bottom)).isActive = true
        checkoutButtonContainer.heightAnchor.constraint(equalToConstant: tabBarHeight * 2 - bottom).isActive = true
        checkoutButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        checkoutButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        checkoutButtonContainer.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        checkoutButtonContainer.addSubview(checkoutButton)
        checkoutButton.centerYAnchor.constraint(equalTo: checkoutButtonContainer.centerYAnchor).isActive = true
        checkoutButton.centerXAnchor.constraint(equalTo: checkoutButtonContainer.centerXAnchor).isActive = true
        checkoutButton.widthAnchor.constraint(equalTo: checkoutButtonContainer.widthAnchor).isActive = true
        checkoutButton.heightAnchor.constraint(equalTo: checkoutButtonContainer.heightAnchor).isActive = true
        
        

    }
    
    
}

