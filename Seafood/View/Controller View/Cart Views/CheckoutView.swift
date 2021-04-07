//
//  CheckoutView.swift
//  Seafood
//
//  Created by Riza on 3/12/21.
//

import UIKit
import SnapKit

class CheckoutView: UIView {
    
    //MARK: - Adding Views
    
    let sumTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Сумма заказа с доставкой"
        label.numberOfLines = 1
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 1
        label.text = "3500"
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
    
    let selectPaymentMethodButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать форму оплаты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let selectPaymentMethodButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let deliveryButton: UIButton = {
        let button = UIButton()
        let deliveryImage = UIImage(named: "delivery")?.withRenderingMode(.alwaysTemplate)
        button.setImage(deliveryImage, for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let deliveryCheckImageView: UIImageView = {
        let view = UIImageView()
        let checkImage = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        view.image = checkImage
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let takeawayButton: UIButton = {
        let button = UIButton()
        let takeawayImage = UIImage(named: "takeaway")?.withRenderingMode(.alwaysTemplate)
        button.setImage(takeawayImage, for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let takeawayCheckImageView: UIImageView = {
        let view = UIImageView()
        let checkImage = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        view.image = checkImage
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - Setup delivery views
    
    let deliveryDetailsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let deliveryDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка работает с 11:00 до 20:00.\nКурьер будет отправлен через 10-15 минут после оплаты заказа.\nПо адресам, находящимся вне квадрата Аль-Фараби - Саина - Рыскулова - Достык, цена будет определена оператором."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.addImageWith(name: "clock", behindText: false)
        return label
    }()
    
    let addressImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let addressImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "address")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        view.image = tintedImage
        return view
    }()
    
    let addressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Адрес", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let chosenAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Не указано"
        return label
    }()
    
    let dateImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let dateImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "time")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        view.image = tintedImage
        return view
    }()
    
    let dateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Дата", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let chosenDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Не указано"
        label.textColor = .gray
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Время", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.contentMode = .center
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let chosenTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Не указано"
        label.textColor = .gray
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let nameImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "name")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        view.image = tintedImage
        return view
    }()
    
    let nameContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Полное имя"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите свое имя"
        tf.layer.cornerRadius = 5
        tf.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        tf.layer.borderWidth = 0.5
        tf.backgroundColor = .white
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.keyboardType = .default
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let phoneImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let addressButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let dateButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let timeButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let phoneImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "phone")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        view.image = tintedImage
        return view
    }()
    
    let phoneContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let bigContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        return view
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите телефон"
        tf.layer.cornerRadius = 5
        tf.layer.borderColor = #colorLiteral(red: 0, green: 0.4800944924, blue: 0.9989064336, alpha: 1)
        tf.layer.borderWidth = 0.5
        tf.backgroundColor = .white
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.keyboardType = .default
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.contentMode = .center
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
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
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сбросить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
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
    
    //MARK: - Init functions
    
    let tabBarController = UITabBarController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDeliveryView()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    
    
    
    //MARK: - Setting up Delivery Functions
    
    func setupDeliveryView() {

        let tabBarHeight = tabBarController.tabBar.frame.height
        
        var bottom: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            let bottomPadding = window.safeAreaInsets.bottom
            bottom = bottomPadding
        }
        
        deliveryButton.isSelected = true
        takeawayButton.isSelected = false
        datePicker.isHidden = true
        timePicker.isHidden = true
        deliveryDetailsContainer.isHidden = false
        timeButtonContainer.isHidden = false
        addressButton.isEnabled = true
        dateButton.isSelected = true
                
        setupButtons()
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width
        let height = screenSize.height
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: width, height: 850)
        scrollView.frame = CGRect(x: 0, y: 0, width: width, height: height)

        //Top part
        scrollView.addSubview(walletImageViewContainer)
        walletImageViewContainer.frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        
        walletImageViewContainer.addSubview(walletImageView)
        walletImageView.frame = CGRect(x: 20, y: 30, width: 25, height: 25)
        
        scrollView.addSubview(sumDetailsContainer)
        sumDetailsContainer.frame = CGRect(x: 61, y: 0, width: width, height: 80)

        sumDetailsContainer.addSubview(sumTextLabel)
        sumTextLabel.frame = CGRect(x: 20, y: 20, width: 200, height: 12)

        sumDetailsContainer.addSubview(sumLabel)
        sumLabel.frame = CGRect(x: 20, y: 40, width: 200, height: 24)

        scrollView.addSubview(deliveryButton)
        deliveryButton.frame = CGRect(x: 10, y: 100, width: width/2-20, height: 140)

        //Delivery and Takeaway Buttins
        deliveryButton.addSubview(deliveryCheckImageView)
        deliveryCheckImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        deliveryCheckImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        deliveryCheckImageView.topAnchor.constraint(equalTo: deliveryButton.topAnchor, constant: 10).isActive = true
        deliveryCheckImageView.leadingAnchor.constraint(equalTo: deliveryButton.leadingAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(takeawayButton)
        takeawayButton.frame = CGRect(x: width/2 + 10, y: 100, width: width/2-20, height: 140)

        takeawayButton.addSubview(takeawayCheckImageView)
        takeawayCheckImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        takeawayCheckImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        takeawayCheckImageView.topAnchor.constraint(equalTo: takeawayButton.topAnchor, constant: 10).isActive = true
        takeawayCheckImageView.leadingAnchor.constraint(equalTo: takeawayButton.leadingAnchor, constant: 10).isActive = true

        // Select payment method button
        self.addSubview(selectPaymentMethodButtonContainer)
        selectPaymentMethodButtonContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(tabBarHeight + bottom)).isActive = true
        selectPaymentMethodButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        selectPaymentMethodButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        selectPaymentMethodButtonContainer.heightAnchor.constraint(equalToConstant: tabBarHeight * 2 - bottom).isActive = true
        selectPaymentMethodButtonContainer.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        selectPaymentMethodButtonContainer.addSubview(selectPaymentMethodButton)
        selectPaymentMethodButton.centerYAnchor.constraint(equalTo: selectPaymentMethodButtonContainer.centerYAnchor).isActive = true
        selectPaymentMethodButton.centerXAnchor.constraint(equalTo: selectPaymentMethodButtonContainer.centerXAnchor).isActive = true
        selectPaymentMethodButton.widthAnchor.constraint(equalTo: selectPaymentMethodButtonContainer.widthAnchor).isActive = true
        selectPaymentMethodButton.heightAnchor.constraint(equalTo: selectPaymentMethodButtonContainer.heightAnchor).isActive = true
        
        //Delivery details container
        scrollView.addSubview(deliveryDetailsContainer)
        deliveryDetailsContainer.frame = CGRect(x: 0, y: 250, width: width, height: 160)
        
        deliveryDetailsContainer.addSubview(deliveryDetailsLabel)
        deliveryDetailsLabel.leadingAnchor.constraint(equalTo: deliveryDetailsContainer.leadingAnchor, constant: 10).isActive = true
        deliveryDetailsLabel.trailingAnchor.constraint(equalTo: deliveryDetailsContainer.trailingAnchor, constant: -10).isActive = true
        deliveryDetailsLabel.heightAnchor.constraint(equalTo: deliveryDetailsContainer.heightAnchor, constant: -10).isActive = true

        //Address part
        scrollView.addSubview(addressImageContainer)
        addressImageContainer.frame = CGRect(x: 0, y: 420, width: 40, height: 70)

        addressImageContainer.addSubview(addressImageView)
        addressImageView.centerYAnchor.constraint(equalTo: addressImageContainer.centerYAnchor).isActive = true
        addressImageView.centerXAnchor.constraint(equalTo: addressImageContainer.centerXAnchor).isActive = true
        
        scrollView.addSubview(addressButtonContainer)
        addressButtonContainer.frame = CGRect(x: 41, y: 420, width: width-40, height: 70)

        addressButtonContainer.addSubview(addressButton)
        addressButton.titleLabel?.leadingAnchor.constraint(equalTo: addressButtonContainer.leadingAnchor, constant: 20).isActive = true
        addressButton.titleLabel?.topAnchor.constraint(equalTo: addressButtonContainer.topAnchor, constant: 10).isActive = true
        
        addressButtonContainer.addSubview(chosenAddressLabel)
        addressButton.leadingAnchor.constraint(equalTo: addressButtonContainer.leadingAnchor).isActive = true
        addressButton.trailingAnchor.constraint(equalTo: addressButtonContainer.trailingAnchor).isActive = true

        chosenAddressLabel.leadingAnchor.constraint(equalTo: addressButtonContainer.leadingAnchor, constant: 20).isActive = true
        chosenAddressLabel.topAnchor.constraint(equalTo: addressButtonContainer.centerYAnchor).isActive = true
        chosenAddressLabel.text = "Не указано"
        
        //Big container part
        scrollView.addSubview(clearButton)
        clearButton.frame = CGRect(x: width - 100, y: 495, width: 100, height: 20)
        
        scrollView.addSubview(bigContainer)
        bigContainer.frame = CGRect(x: 0, y: 491, width: width, height: 252)
        
        bigContainer.addSubview(dateImageContainer)
        dateImageContainer.frame = CGRect(x: 0, y: 0, width: 40, height: 70)
        
        //Date part
        dateImageContainer.addSubview(dateImageView)
        dateImageView.centerYAnchor.constraint(equalTo: dateImageContainer.centerYAnchor).isActive = true
        dateImageView.centerXAnchor.constraint(equalTo: dateImageContainer.centerXAnchor).isActive = true
        
        bigContainer.addSubview(dateButtonContainer)
        dateButtonContainer.frame = CGRect(x: 41, y: 0, width: width/2-41, height: 70)
        
        dateButtonContainer.addSubview(dateButton)
        dateButton.titleLabel?.leadingAnchor.constraint(equalTo: dateButtonContainer.leadingAnchor, constant: 20).isActive = true
        dateButton.titleLabel?.topAnchor.constraint(equalTo: dateButtonContainer.topAnchor, constant: 10).isActive = true
        dateButton.leadingAnchor.constraint(equalTo: dateButtonContainer.leadingAnchor).isActive = true
        dateButton.trailingAnchor.constraint(equalTo: dateButtonContainer.trailingAnchor).isActive = true
        
        dateButtonContainer.addSubview(chosenDateLabel)
        chosenDateLabel.leadingAnchor.constraint(equalTo: dateButtonContainer.leadingAnchor, constant: 20).isActive = true
        chosenDateLabel.topAnchor.constraint(equalTo: dateButtonContainer.centerYAnchor).isActive = true
        
        //Time part
        bigContainer.addSubview(timeButtonContainer)
        timeButtonContainer.frame = CGRect(x: width/2 + 1, y: 0, width: width/2, height: 70)
        
        timeButtonContainer.addSubview(timeButton)
        timeButton.leadingAnchor.constraint(equalTo: timeButtonContainer.leadingAnchor).isActive = true
        timeButton.trailingAnchor.constraint(equalTo: timeButtonContainer.trailingAnchor).isActive = true
        timeButton.titleLabel?.leadingAnchor.constraint(equalTo: timeButtonContainer.leadingAnchor, constant: 20).isActive = true
        timeButton.titleLabel?.topAnchor.constraint(equalTo: timeButtonContainer.topAnchor, constant: 10).isActive = true
        
        timeButtonContainer.addSubview(chosenTimeLabel)
        chosenTimeLabel.leadingAnchor.constraint(equalTo: timeButtonContainer.leadingAnchor, constant: 20).isActive = true
        chosenTimeLabel.topAnchor.constraint(equalTo: timeButtonContainer.centerYAnchor).isActive = true
        
        //Name part
        bigContainer.addSubview(nameImageContainer)
        nameImageContainer.frame = CGRect(x: 0, y: 71, width: 40, height: 90)

        nameImageContainer.addSubview(nameImageView)
        nameImageView.centerYAnchor.constraint(equalTo: nameImageContainer.centerYAnchor).isActive = true
        nameImageView.centerXAnchor.constraint(equalTo: nameImageContainer.centerXAnchor).isActive = true
        
        bigContainer.addSubview(nameContainer)
        nameContainer.frame = CGRect(x: 41, y: 71, width: width-41, height: 90)

        nameContainer.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameContainer.topAnchor, constant: 10).isActive = true
        
        nameContainer.addSubview(nameTextField)
        nameTextField.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Phone number part
        bigContainer.addSubview(phoneImageContainer)
        phoneImageContainer.frame = CGRect(x: 0, y: 162, width: 40, height: 90)

        phoneImageContainer.addSubview(phoneImageView)
        phoneImageView.centerYAnchor.constraint(equalTo: phoneImageContainer.centerYAnchor).isActive = true
        phoneImageView.centerXAnchor.constraint(equalTo: phoneImageContainer.centerXAnchor).isActive = true
        
        bigContainer.addSubview(phoneContainer)
        phoneContainer.frame = CGRect(x: 41, y: 162, width: width-41, height: 90)

        phoneContainer.addSubview(phoneLabel)
        phoneLabel.leadingAnchor.constraint(equalTo: phoneContainer.leadingAnchor, constant: 20).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: phoneContainer.topAnchor, constant: 10).isActive = true
        
        phoneContainer.addSubview(phoneTextField)
        phoneTextField.leadingAnchor.constraint(equalTo: phoneContainer.leadingAnchor, constant: 20).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 5).isActive = true
        phoneTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    func setupTakeawayViews() {
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width

        addressButton.isEnabled = false
        deliveryButton.isSelected = false
        takeawayButton.isSelected = true
        timeButtonContainer.isHidden = true
        deliveryDetailsContainer.isHidden = true
        
        setupButtons()

        addressImageContainer.frame = CGRect(x: 0, y: 250, width: 40, height: 70)
        addressButtonContainer.frame = CGRect(x: 41, y: 250, width: width-41, height: 70)
        bigContainer.frame = CGRect(x: 0, y: 321, width: width, height: 252)
        dateButtonContainer.frame = CGRect(x: 41, y: 0, width: width-41, height: 70)
        chosenAddressLabel.text = "г. Алматы, пр.Гагарина,236Б"
        clearButton.frame = CGRect(x: width - 100, y: 325, width: 100, height: 20)

    }
    
    //Setting up buttons when selected
    func setupButtons() {
        
        if deliveryButton.isSelected {

            deliveryButton.isSelected = !deliveryButton.isSelected
            deliveryButton.layer.borderColor = UIColor.blue.cgColor
            deliveryButton.tintColor = .blue
            deliveryButton.layer.borderWidth = 2
            deliveryCheckImageView.isHidden = false
            
            takeawayButton.layer.borderColor = UIColor.black.cgColor
            takeawayButton.tintColor = .black
            takeawayButton.layer.borderWidth = 1
            takeawayCheckImageView.isHidden = true
        }
        
        if takeawayButton.isSelected {

            takeawayButton.isSelected = !takeawayButton.isSelected
            takeawayButton.layer.borderColor = UIColor.blue.cgColor
            takeawayButton.tintColor = .blue
            takeawayButton.layer.borderWidth = 2
            takeawayCheckImageView.isHidden = false
            
            deliveryButton.layer.borderColor = UIColor.black.cgColor
            deliveryButton.tintColor = .black
            deliveryButton.layer.borderWidth = 1
            deliveryCheckImageView.isHidden = true
        }
    }
    
    func dateButtonPressed() {
        
            
        
        
        if takeawayButton.isSelected {
            if dateButton.isSelected {
                bigContainer.frame = CGRect(x: 0, y: 351, width: self.frame.width, height: 252)

            }
        }
        
    }
    
}
