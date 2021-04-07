//
//  SelectPaymentMethodView.swift
//  Seafood
//
//  Created by Riza on 3/12/21.
//

import UIKit

class SelectPaymentMethodView: UIView {
    
    //MARK: - Adding Views
    
    let sumTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Сумма к оплате"
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
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        return container
    }()
    
    let walletImageViewContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        return container
    }()
    
    let confirmOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить заказ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let confirmOrderButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    //MARK: - Checking Button
    
    let checkingPaymentButton: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFill
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        let deliveryImage = UIImage(named: "checking")?.withRenderingMode(.alwaysTemplate)
        button.setImage(deliveryImage, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let checkingCheckImageView: UIImageView = {
        let view = UIImageView()
        let checkImage = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        view.image = checkImage
        return view
    }()
    
    
    //MARK: - Kaspi Button
    
    let kaspiButton: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        let takeawayImage = UIImage(named: "kaspi")?.withRenderingMode(.alwaysTemplate)
        button.setImage(takeawayImage, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kaspiCheckImageView: UIImageView = {
        let view = UIImageView()
        let checkImage = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        view.image = checkImage
        return view
    }()
    
    
    
    //MARK: - Transfer Button
    
    let transferButton: UIButton = {
        let button = UIButton()
        let deliveryImage = UIImage(named: "transfer")?.withRenderingMode(.alwaysTemplate)
        button.setImage(deliveryImage, for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let transferCheckImageView: UIImageView = {
        let view = UIImageView()
        let checkImage = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        view.image = checkImage
        return view
    }()
    
   
    //MARK: - Online Button
    
    let onlinePaymentButton: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        let takeawayImage = UIImage(named: "online")?.withRenderingMode(.alwaysTemplate)
        button.setImage(takeawayImage, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let onlinePaymentCheckImageView: UIImageView = {
        let view = UIImageView()
        let checkImage = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        view.image = checkImage
        return view
    }()
    
   
    
    let cardAccountLabelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tabBarController = UITabBarController()
    
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
    
//MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupCheckingView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up UI
    
    func setupViews() {
        
        let tabBarHeight = tabBarController.tabBar.frame.height
        
        var bottom: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            let bottomPadding = window.safeAreaInsets.bottom
            bottom = bottomPadding
        }

        setupCheckingView()
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        
        
        self.addSubview(walletImageViewContainer)
        walletImageViewContainer.frame = CGRect(x: 0, y: topBarHeight, width: 60, height: 80)

        walletImageViewContainer.addSubview(walletImageView)
        walletImageView.frame = CGRect(x: 20, y: 30, width: 25, height: 25)

        self.addSubview(sumDetailsContainer)
        sumDetailsContainer.leadingAnchor.constraint(equalTo: walletImageViewContainer.trailingAnchor, constant: 1).isActive = true
        sumDetailsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        sumDetailsContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        sumDetailsContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: topBarHeight).isActive = true
        
        sumDetailsContainer.addSubview(sumTextLabel)
        sumTextLabel.frame = CGRect(x: 20, y: 20, width: 200, height: 12)

        sumDetailsContainer.addSubview(sumLabel)
        sumLabel.frame = CGRect(x: 20, y: 40, width: 200, height: 26)
        
        //Checking Payment Button
        self.addSubview(checkingPaymentButton)
        checkingPaymentButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        checkingPaymentButton.topAnchor.constraint(equalTo: sumDetailsContainer.bottomAnchor, constant: 30).isActive = true
        checkingPaymentButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        checkingPaymentButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        checkingPaymentButton.addSubview(checkingCheckImageView)
        checkingCheckImageView.frame = CGRect(x: 10, y: 10, width: 15, height: 15)

        //Kaspi Button
        self.addSubview(kaspiButton)
        kaspiButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        kaspiButton.topAnchor.constraint(equalTo: sumDetailsContainer.bottomAnchor, constant: 30).isActive = true
        kaspiButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
        kaspiButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        kaspiButton.addSubview(kaspiCheckImageView)
        kaspiCheckImageView.frame = CGRect(x: 10, y: 10, width: 15, height: 15)

        //Transfer Button
        self.addSubview(transferButton)
        transferButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        transferButton.topAnchor.constraint(equalTo: checkingPaymentButton.bottomAnchor, constant: 10).isActive = true
        transferButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        transferButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        transferButton.addSubview(transferCheckImageView)
        transferCheckImageView.frame = CGRect(x: 10, y: 10, width: 15, height: 15)

        //Online Button
        self.addSubview(onlinePaymentButton)
        onlinePaymentButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        onlinePaymentButton.topAnchor.constraint(equalTo: kaspiButton.bottomAnchor, constant: 10).isActive = true
        onlinePaymentButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
        onlinePaymentButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        onlinePaymentButton.addSubview(onlinePaymentCheckImageView)
        onlinePaymentCheckImageView.frame = CGRect(x: 10, y: 10, width: 15, height: 15)
        
        //Card Account
        self.addSubview(cardAccountLabelContainer)
        cardAccountLabelContainer.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        cardAccountLabelContainer.topAnchor.constraint(equalTo: transferButton.bottomAnchor, constant: 20).isActive = true
        cardAccountLabelContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardAccountLabelContainer.addSubview(cardAccountNumberLabel)
        cardAccountNumberLabel.centerYAnchor.constraint(equalTo: cardAccountLabelContainer.centerYAnchor).isActive = true
        cardAccountNumberLabel.leadingAnchor.constraint(equalTo: cardAccountLabelContainer.leadingAnchor, constant: 15).isActive = true

        //Confirm button
        self.addSubview(confirmOrderButtonContainer)
        confirmOrderButtonContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(tabBarHeight + bottom)).isActive = true
        confirmOrderButtonContainer.heightAnchor.constraint(equalToConstant: tabBarHeight * 2 - bottom).isActive = true
        confirmOrderButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        confirmOrderButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        confirmOrderButtonContainer.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        confirmOrderButtonContainer.addSubview(confirmOrderButton)
        confirmOrderButton.centerYAnchor.constraint(equalTo: confirmOrderButtonContainer.centerYAnchor).isActive = true
        confirmOrderButton.centerXAnchor.constraint(equalTo: confirmOrderButtonContainer.centerXAnchor).isActive = true
        confirmOrderButton.widthAnchor.constraint(equalTo: confirmOrderButtonContainer.widthAnchor).isActive = true
        confirmOrderButton.heightAnchor.constraint(equalTo: confirmOrderButtonContainer.heightAnchor).isActive = true

    }

    func setupCheckingView() {
        
        checkingPaymentButton.isSelected = true
        cardAccountLabelContainer.isHidden = false
        cardAccountNumberLabel.text = "Номер счета: KZ08722S00003644182"
        checkingPaymentButton.isSelected = !checkingPaymentButton.isSelected
        checkingPaymentButton.layer.borderColor = UIColor.blue.cgColor
        checkingPaymentButton.tintColor = .blue
        checkingPaymentButton.layer.borderWidth = 2
        checkingCheckImageView.isHidden = false
        
        kaspiButton.layer.borderColor = UIColor.black.cgColor
        kaspiButton.tintColor = .black
        kaspiButton.layer.borderWidth = 1
        kaspiCheckImageView.isHidden = true
        
        transferButton.layer.borderColor = UIColor.black.cgColor
        transferButton.tintColor = .black
        transferButton.layer.borderWidth = 1
        transferCheckImageView.isHidden = true
        
        onlinePaymentButton.layer.borderColor = UIColor.black.cgColor
        onlinePaymentButton.tintColor = .black
        onlinePaymentButton.layer.borderWidth = 1
        onlinePaymentCheckImageView.isHidden = true

    }
    
    func setupOnlineView() {
        
        onlinePaymentButton.isSelected = true
        cardAccountLabelContainer.isHidden = true
        onlinePaymentButton.isSelected = !onlinePaymentButton.isSelected
        onlinePaymentButton.layer.borderColor = UIColor.blue.cgColor
        onlinePaymentButton.tintColor = .blue
        onlinePaymentButton.layer.borderWidth = 2
        onlinePaymentCheckImageView.isHidden = false
        
        checkingPaymentButton.layer.borderColor = UIColor.black.cgColor
        checkingPaymentButton.tintColor = .black
        checkingPaymentButton.layer.borderWidth = 1
        checkingCheckImageView.isHidden = true
        
        kaspiButton.layer.borderColor = UIColor.black.cgColor
        kaspiButton.tintColor = .black
        kaspiButton.layer.borderWidth = 1
        kaspiCheckImageView.isHidden = true
        
        transferButton.layer.borderColor = UIColor.black.cgColor
        transferButton.tintColor = .black
        transferButton.layer.borderWidth = 1
        transferCheckImageView.isHidden = true
        
    }
    
    func setupTransferView() {
        
        transferButton.isSelected = true
        cardAccountLabelContainer.isHidden = false
        cardAccountNumberLabel.text = "Номер карты: 5169 4931 6288 4988"
        transferButton.isSelected = !transferButton.isSelected
        transferButton.layer.borderColor = UIColor.blue.cgColor
        transferButton.tintColor = .blue
        transferButton.layer.borderWidth = 2
        transferCheckImageView.isHidden = false
        
        checkingPaymentButton.layer.borderColor = UIColor.black.cgColor
        checkingPaymentButton.tintColor = .black
        checkingPaymentButton.layer.borderWidth = 1
        checkingCheckImageView.isHidden = true
        
        kaspiButton.layer.borderColor = UIColor.black.cgColor
        kaspiButton.tintColor = .black
        kaspiButton.layer.borderWidth = 1
        kaspiCheckImageView.isHidden = true
        
        onlinePaymentButton.layer.borderColor = UIColor.black.cgColor
        onlinePaymentButton.tintColor = .black
        onlinePaymentButton.layer.borderWidth = 1
        onlinePaymentCheckImageView.isHidden = true
        
    }
    
    func setupKaspiView() {
        
        kaspiButton.isSelected = true
        cardAccountLabelContainer.isHidden = true
        kaspiButton.isSelected = !kaspiButton.isSelected
        kaspiButton.layer.borderColor = UIColor.blue.cgColor
        kaspiButton.tintColor = .blue
        kaspiButton.layer.borderWidth = 2
        kaspiCheckImageView.isHidden = false
        
        checkingPaymentButton.layer.borderColor = UIColor.black.cgColor
        checkingPaymentButton.tintColor = .black
        checkingPaymentButton.layer.borderWidth = 1
        checkingCheckImageView.isHidden = true
        
        transferButton.layer.borderColor = UIColor.black.cgColor
        transferButton.tintColor = .black
        transferButton.layer.borderWidth = 1
        transferCheckImageView.isHidden = true
        
        onlinePaymentButton.layer.borderColor = UIColor.black.cgColor
        onlinePaymentButton.tintColor = .black
        onlinePaymentButton.layer.borderWidth = 1
        onlinePaymentCheckImageView.isHidden = true

    }
    
    
    
}
