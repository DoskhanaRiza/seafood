//
//  OrderDetailsView.swift
//  Seafood
//
//  Created by Riza on 3/12/21.
//

import UIKit

class OrderDetailsView: UIView {
    
    //MARK: - Adding Views
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(OrderDetailsTableViewCell.self, forCellReuseIdentifier: OrderDetailsTableViewCell.identifier)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let statusContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let orderIDLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "#100323"
        return label
    }()
    
    let orderStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Отменен"
        label.textColor = .red
        return label
    }()
    
    let orderDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let phoneTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Телефон"
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        return label
    }()
    
    let walletImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let walletImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallet")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let totalSumTextContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let totalSumTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Итого к оплате"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let orderSumContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let orderSumTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сумма заказа"
        return label
    }()
    
    let orderSumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deliveryCostContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let deliveryCostTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Стоимость доставки"
        return label
    }()
    
    let deliveryCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(0) тг"
        return label
    }()
    
    let totalOrderSumContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let totalOrderSumTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Итого к оплате"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let totalOrderSumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let cartImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let cartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cart")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cartContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let cartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Корзина"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let positionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ПОЗИЦИИ"
        return label
    }()
    
    let menuContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let sumContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let sumTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сумма"
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        return label
    }()
    
    let deliveryImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let deliveryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "address")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let deliveryContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Доставка"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let deliveryTypeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let deliveryTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let deliveryTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deliveryCostTxtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Стоимость"
        return label
    }()
    
    let deliverySumIntLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(0) тг"
        return label
    }()
    
    let addressContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailedAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let paymentImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let paymentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "credit-card")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let paymentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Оплата"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let paymentTypeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.blue.cgColor
        return view
    }()
    
    let paymentTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let paymentTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let additionalImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let additionalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "more")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let additionalContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let commentsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let additionalTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Дополнительно"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Комментарий к заказу"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Не указано"
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        return scrollView
    }()
    
    let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.style = .large
        activityView.translatesAutoresizingMaskIntoConstraints = false
        return activityView
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
        
        self.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)

//        activityView.startAnimating()
        self.addSubview(activityView)
        activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.contentSize = CGSize(width: self.frame.width, height: 1600)

        // Status section
        scrollView.addSubview(statusContainer)
        statusContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        statusContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        statusContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        statusContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        statusContainer.addSubview(orderIDLabel)
        orderIDLabel.leadingAnchor.constraint(equalTo: statusContainer.leadingAnchor, constant: 15).isActive = true
        orderIDLabel.centerYAnchor.constraint(equalTo: statusContainer.centerYAnchor).isActive = true
        orderIDLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        statusContainer.addSubview(orderStatusLabel)
        orderStatusLabel.leadingAnchor.constraint(equalTo: orderIDLabel.trailingAnchor, constant: 15).isActive = true
        orderStatusLabel.centerYAnchor.constraint(equalTo: statusContainer.centerYAnchor).isActive = true
        orderStatusLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        statusContainer.addSubview(orderDateLabel)
        orderDateLabel.leadingAnchor.constraint(equalTo: orderStatusLabel.trailingAnchor, constant: 15).isActive = true
        orderDateLabel.centerYAnchor.constraint(equalTo: statusContainer.centerYAnchor).isActive = true
        orderDateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(userNameContainer)
        userNameContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        userNameContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        userNameContainer.topAnchor.constraint(equalTo: statusContainer.bottomAnchor, constant: 1).isActive = true
        userNameContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        userNameContainer.addSubview(userNameLabel)
        userNameLabel.leadingAnchor.constraint(equalTo: userNameContainer.leadingAnchor, constant: 15).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: userNameContainer.centerYAnchor).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: userNameContainer.trailingAnchor, constant: -15).isActive = true
        
        scrollView.addSubview(phoneNumberContainer)
        phoneNumberContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        phoneNumberContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        phoneNumberContainer.topAnchor.constraint(equalTo: userNameContainer.bottomAnchor, constant: 1).isActive = true
        phoneNumberContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        phoneNumberContainer.addSubview(phoneTextLabel)
        phoneTextLabel.leadingAnchor.constraint(equalTo: phoneNumberContainer.leadingAnchor, constant: 15).isActive = true
        phoneTextLabel.topAnchor.constraint(equalTo: phoneNumberContainer.topAnchor, constant: 10).isActive = true
        phoneTextLabel.trailingAnchor.constraint(equalTo: phoneNumberContainer.trailingAnchor, constant: -15).isActive = true
        
        phoneNumberContainer.addSubview(phoneNumberLabel)
        phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberContainer.leadingAnchor, constant: 15).isActive = true
        phoneNumberLabel.bottomAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor, constant: -10).isActive = true
        phoneNumberLabel.trailingAnchor.constraint(equalTo: phoneNumberContainer.trailingAnchor, constant: -15).isActive = true
        
        // Order sum Section
        scrollView.addSubview(walletImageViewContainer)
        walletImageViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        walletImageViewContainer.topAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor, constant: 30).isActive = true
        walletImageViewContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        walletImageViewContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        walletImageViewContainer.addSubview(walletImageView)
        walletImageView.centerYAnchor.constraint(equalTo: walletImageViewContainer.centerYAnchor).isActive = true
        walletImageView.centerXAnchor.constraint(equalTo: walletImageViewContainer.centerXAnchor).isActive = true
        walletImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        walletImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        scrollView.addSubview(totalSumTextContainer)
        totalSumTextContainer.topAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor, constant: 30).isActive = true
        totalSumTextContainer.leadingAnchor.constraint(equalTo: walletImageViewContainer.trailingAnchor, constant: 1).isActive = true
        totalSumTextContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        totalSumTextContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        totalSumTextContainer.addSubview(totalSumTextLabel)
        totalSumTextLabel.leadingAnchor.constraint(equalTo: totalSumTextContainer.leadingAnchor, constant: 15).isActive = true
        totalSumTextLabel.centerYAnchor.constraint(equalTo: totalSumTextContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(orderSumContainer)
        orderSumContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        orderSumContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        orderSumContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orderSumContainer.topAnchor.constraint(equalTo: totalSumTextContainer.bottomAnchor, constant: 1).isActive = true
        
        orderSumContainer.addSubview(orderSumTextLabel)
        orderSumTextLabel.leadingAnchor.constraint(equalTo: orderSumContainer.leadingAnchor, constant: 15).isActive = true
        orderSumTextLabel.centerYAnchor.constraint(equalTo: orderSumContainer.centerYAnchor).isActive = true
        
        orderSumContainer.addSubview(orderSumLabel)
        orderSumLabel.trailingAnchor.constraint(equalTo: orderSumContainer.trailingAnchor, constant: -15).isActive = true
        orderSumLabel.centerYAnchor.constraint(equalTo: orderSumContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(deliveryCostContainer)
        deliveryCostContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        deliveryCostContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        deliveryCostContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deliveryCostContainer.topAnchor.constraint(equalTo: orderSumContainer.bottomAnchor, constant: 1).isActive = true
        
        deliveryCostContainer.addSubview(deliveryCostTextLabel)
        deliveryCostTextLabel.leadingAnchor.constraint(equalTo: deliveryCostContainer.leadingAnchor, constant: 15).isActive = true
        deliveryCostTextLabel.centerYAnchor.constraint(equalTo: deliveryCostContainer.centerYAnchor).isActive = true
        
        deliveryCostContainer.addSubview(deliveryCostLabel)
        deliveryCostLabel.trailingAnchor.constraint(equalTo: deliveryCostContainer.trailingAnchor, constant: -15).isActive = true
        deliveryCostLabel.centerYAnchor.constraint(equalTo: deliveryCostContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(totalOrderSumContainer)
        totalOrderSumContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        totalOrderSumContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        totalOrderSumContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        totalOrderSumContainer.topAnchor.constraint(equalTo: deliveryCostContainer.bottomAnchor, constant: 1).isActive = true
        
        totalOrderSumContainer.addSubview(totalOrderSumTextLabel)
        totalOrderSumTextLabel.leadingAnchor.constraint(equalTo: totalOrderSumContainer.leadingAnchor, constant: 15).isActive = true
        totalOrderSumTextLabel.centerYAnchor.constraint(equalTo: totalOrderSumContainer.centerYAnchor).isActive = true
        
        totalOrderSumContainer.addSubview(totalOrderSumLabel)
        totalOrderSumLabel.trailingAnchor.constraint(equalTo: totalOrderSumContainer.trailingAnchor, constant: -15).isActive = true
        totalOrderSumLabel.centerYAnchor.constraint(equalTo: totalOrderSumContainer.centerYAnchor).isActive = true
        
        // Cart Section
        scrollView.addSubview(cartImageViewContainer)
        cartImageViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cartImageViewContainer.topAnchor.constraint(equalTo: totalOrderSumContainer.bottomAnchor, constant: 30).isActive = true
        cartImageViewContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        cartImageViewContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cartImageViewContainer.addSubview(cartImageView)
        cartImageView.centerYAnchor.constraint(equalTo: cartImageViewContainer.centerYAnchor).isActive = true
        cartImageView.centerXAnchor.constraint(equalTo: cartImageViewContainer.centerXAnchor).isActive = true
        cartImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        cartImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        scrollView.addSubview(cartContainer)
        cartContainer.topAnchor.constraint(equalTo: totalOrderSumContainer.bottomAnchor, constant: 30).isActive = true
        cartContainer.leadingAnchor.constraint(equalTo: cartImageViewContainer.trailingAnchor, constant: 1).isActive = true
        cartContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        cartContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        cartContainer.addSubview(cartLabel)
        cartLabel.leadingAnchor.constraint(equalTo: cartContainer.leadingAnchor, constant: 15).isActive = true
        cartLabel.centerYAnchor.constraint(equalTo: cartContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(tableView)
//        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        tableView.topAnchor.constraint(equalTo: cartContainer.bottomAnchor, constant: 25).isActive = true
//        tableView.heightAnchor.constraint(equalToConstant: tableView.intrinsicContentSize.height).isActive = true
        
        tableView.addSubview(positionsLabel)
        positionsLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 15).isActive = true
        
        scrollView.addSubview(sumContainer)
        sumContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        sumContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        sumContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sumContainer.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 1).isActive = true
        
        sumContainer.addSubview(sumTextLabel)
        sumTextLabel.leadingAnchor.constraint(equalTo: sumContainer.leadingAnchor, constant: 15).isActive = true
        sumTextLabel.centerYAnchor.constraint(equalTo: sumContainer.centerYAnchor).isActive = true
        
        sumContainer.addSubview(sumLabel)
        sumLabel.trailingAnchor.constraint(equalTo: sumContainer.trailingAnchor, constant: -15).isActive = true
        sumLabel.centerYAnchor.constraint(equalTo: sumContainer.centerYAnchor).isActive = true
        
        // Delivery Section
        scrollView.addSubview(deliveryImageViewContainer)
        deliveryImageViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        deliveryImageViewContainer.topAnchor.constraint(equalTo: sumContainer.bottomAnchor, constant: 30).isActive = true
        deliveryImageViewContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        deliveryImageViewContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        deliveryImageViewContainer.addSubview(deliveryImageView)
        deliveryImageView.centerYAnchor.constraint(equalTo: deliveryImageViewContainer.centerYAnchor).isActive = true
        deliveryImageView.centerXAnchor.constraint(equalTo: deliveryImageViewContainer.centerXAnchor).isActive = true
        deliveryImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deliveryImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        scrollView.addSubview(deliveryContainer)
        deliveryContainer.topAnchor.constraint(equalTo: sumContainer.bottomAnchor, constant: 30).isActive = true
        deliveryContainer.leadingAnchor.constraint(equalTo: deliveryImageViewContainer.trailingAnchor, constant: 1).isActive = true
        deliveryContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        deliveryContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        deliveryContainer.addSubview(deliveryLabel)
        deliveryLabel.leadingAnchor.constraint(equalTo: deliveryContainer.leadingAnchor, constant: 15).isActive = true
        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(deliveryTypeContainer)
        deliveryTypeContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        deliveryTypeContainer.topAnchor.constraint(equalTo: deliveryContainer.bottomAnchor, constant: 10).isActive = true
        deliveryTypeContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        deliveryTypeContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        deliveryTypeContainer.addSubview(deliveryTypeImageView)
        deliveryTypeImageView.centerYAnchor.constraint(equalTo: deliveryTypeContainer.centerYAnchor).isActive = true
        deliveryTypeImageView.centerXAnchor.constraint(equalTo: deliveryTypeContainer.centerXAnchor).isActive = true
        deliveryTypeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        deliveryTypeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        deliveryTypeContainer.addSubview(deliveryTypeLabel)
        deliveryTypeLabel.topAnchor.constraint(equalTo: deliveryTypeImageView.bottomAnchor, constant: 10).isActive = true
        deliveryTypeLabel.centerXAnchor.constraint(equalTo: deliveryTypeContainer.centerXAnchor).isActive = true
        
        scrollView.addSubview(deliveryCostTxtLabel)
        deliveryCostTxtLabel.centerYAnchor.constraint(equalTo: deliveryTypeContainer.centerYAnchor, constant: -10).isActive = true
        deliveryCostTxtLabel.leadingAnchor.constraint(equalTo: deliveryTypeContainer.trailingAnchor, constant: 30).isActive = true
        
        scrollView.addSubview(deliverySumIntLabel)
        deliverySumIntLabel.centerYAnchor.constraint(equalTo: deliveryTypeContainer.centerYAnchor, constant: 10).isActive = true
        deliverySumIntLabel.leadingAnchor.constraint(equalTo: deliveryTypeContainer.trailingAnchor, constant: 30).isActive = true
        
        //Address Section
        scrollView.addSubview(addressContainer)
        addressContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addressContainer.heightAnchor.constraint(equalToConstant: 110).isActive = true
        addressContainer.topAnchor.constraint(equalTo: deliveryTypeContainer.bottomAnchor, constant: 15).isActive = true
        
        addressContainer.addSubview(addressLabel)
        addressLabel.leadingAnchor.constraint(equalTo: addressContainer.leadingAnchor, constant: 15).isActive = true
        addressLabel.topAnchor.constraint(equalTo: addressContainer.topAnchor, constant: 10).isActive = true

        addressContainer.addSubview(detailedAddressLabel)
        detailedAddressLabel.leadingAnchor.constraint(equalTo: addressContainer.leadingAnchor, constant: 15).isActive = true
        detailedAddressLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10).isActive = true
        detailedAddressLabel.trailingAnchor.constraint(equalTo: addressContainer.trailingAnchor, constant: -5).isActive = true
        
        // Payment Section
        scrollView.addSubview(paymentImageViewContainer)
        paymentImageViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        paymentImageViewContainer.topAnchor.constraint(equalTo: addressContainer.bottomAnchor, constant: 30).isActive = true
        paymentImageViewContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        paymentImageViewContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        paymentImageViewContainer.addSubview(paymentImageView)
        paymentImageView.centerYAnchor.constraint(equalTo: paymentImageViewContainer.centerYAnchor).isActive = true
        paymentImageView.centerXAnchor.constraint(equalTo: paymentImageViewContainer.centerXAnchor).isActive = true
        paymentImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        paymentImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        scrollView.addSubview(paymentContainer)
        paymentContainer.topAnchor.constraint(equalTo: addressContainer.bottomAnchor, constant: 30).isActive = true
        paymentContainer.leadingAnchor.constraint(equalTo: paymentImageViewContainer.trailingAnchor, constant: 1).isActive = true
        paymentContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        paymentContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        paymentContainer.addSubview(paymentLabel)
        paymentLabel.leadingAnchor.constraint(equalTo: paymentContainer.leadingAnchor, constant: 15).isActive = true
        paymentLabel.centerYAnchor.constraint(equalTo: paymentContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(paymentTypeContainer)
        paymentTypeContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        paymentTypeContainer.topAnchor.constraint(equalTo: paymentContainer.bottomAnchor, constant: 10).isActive = true
        paymentTypeContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        paymentTypeContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        paymentTypeContainer.addSubview(paymentTypeImageView)
        paymentTypeImageView.centerYAnchor.constraint(equalTo: paymentTypeContainer.centerYAnchor).isActive = true
        paymentTypeImageView.centerXAnchor.constraint(equalTo: paymentTypeContainer.centerXAnchor).isActive = true
        paymentTypeImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        paymentTypeImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        paymentTypeContainer.addSubview(paymentTypeLabel)
        paymentTypeLabel.topAnchor.constraint(equalTo: paymentTypeImageView.bottomAnchor, constant: 10).isActive = true
        paymentTypeLabel.centerXAnchor.constraint(equalTo: paymentTypeContainer.centerXAnchor).isActive = true
        
        // Additional Section
        scrollView.addSubview(additionalImageViewContainer)
        additionalImageViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        additionalImageViewContainer.topAnchor.constraint(equalTo: paymentTypeContainer.bottomAnchor, constant: 15).isActive = true
        additionalImageViewContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        additionalImageViewContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        additionalImageViewContainer.addSubview(additionalImageView)
        additionalImageView.centerYAnchor.constraint(equalTo: additionalImageViewContainer.centerYAnchor).isActive = true
        additionalImageView.centerXAnchor.constraint(equalTo: additionalImageViewContainer.centerXAnchor).isActive = true
        additionalImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        additionalImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        scrollView.addSubview(additionalContainer)
        additionalContainer.topAnchor.constraint(equalTo: paymentTypeContainer.bottomAnchor, constant: 15).isActive = true
        additionalContainer.leadingAnchor.constraint(equalTo: additionalImageViewContainer.trailingAnchor, constant: 1).isActive = true
        additionalContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        additionalContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        additionalContainer.addSubview(additionalTextLabel)
        additionalTextLabel.leadingAnchor.constraint(equalTo: additionalContainer.leadingAnchor, constant: 15).isActive = true
        additionalTextLabel.centerYAnchor.constraint(equalTo: additionalContainer.centerYAnchor).isActive = true
        
        scrollView.addSubview(commentsContainer)
        commentsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        commentsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        commentsContainer.heightAnchor.constraint(equalToConstant: 130).isActive = true
        commentsContainer.topAnchor.constraint(equalTo: additionalContainer.bottomAnchor, constant: 1).isActive = true
        
        commentsContainer.addSubview(commentsLabel)
        commentsLabel.leadingAnchor.constraint(equalTo: commentsContainer.leadingAnchor, constant: 15).isActive = true
        commentsLabel.topAnchor.constraint(equalTo: commentsContainer.topAnchor, constant: 20).isActive = true

        commentsContainer.addSubview(commentDetailsLabel)
        commentDetailsLabel.leadingAnchor.constraint(equalTo: commentsContainer.leadingAnchor, constant: 15).isActive = true
        commentDetailsLabel.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 10).isActive = true
        
    }
    
}
