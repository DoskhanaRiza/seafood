//
//  DeliveryView.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit
import SnapKit

class DeliveryView: UIView {
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "ДОСТАВКА"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let insideSquareLabel: UILabel = {
        let label = UILabel()
        label.text = "КВАДРАТ: АЛЬ-ФАРАБИ - САИНА - РЫСКУЛОВА - ДОСТЫК"
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let insideDividerLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .red
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let minimumSumLabel: UILabel = {
        let label = UILabel()
        label.text = "Минимальная сумма заказа \n\n5000 тенге"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deliveryCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Стоимость доставки \n\n1000 тенге"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let freeDeliveryCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Сумма заказа для бесплатной доставки \n\n 15000 тенге"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let outsideSquareLabel: UILabel = {
        let label = UILabel()
        label.text = "ЗА ПРЕДЕЛАМИ КВАДРАТА"
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let outsideDividerLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .red
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let outsideMinimumSumLabel: UILabel = {
        let label = UILabel()
        label.text = "Минимальная сумма заказа \n\n5000 тенге"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let outsideDeliveryCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Стоимость доставки \n\nУточняйте у оператора"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deliveryScheduleLabel: UILabel = {
        let label = UILabel()
        label.text = "ГРАФИК ДОСТАВКИ"
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.addImageWith(name: "clock", behindText: false)
        return label
    }()
    
    let scheduleDividerLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .red
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let deliveryScheduleInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка работает с 11:00 до 20:00.\nКурьер будет отправлен через 10-15 минут после оплаты заказа."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let insideSquareContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let outsideSquareContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let scheduleContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
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
        
        self.backgroundColor = .blue
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: 650 + 30)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        scrollView.addSubview(deliveryLabel)
        deliveryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        deliveryLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        deliveryLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.addSubview(insideSquareContainer)
        insideSquareContainer.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 15).isActive = true
        insideSquareContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        insideSquareContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        insideSquareContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        insideSquareContainer.addSubview(insideSquareLabel)
        insideSquareLabel.topAnchor.constraint(equalTo: insideSquareContainer.topAnchor, constant: 5).isActive = true
        insideSquareLabel.leadingAnchor.constraint(equalTo: insideSquareContainer.leadingAnchor, constant: 15).isActive = true
        insideSquareLabel.trailingAnchor.constraint(equalTo: insideSquareContainer.trailingAnchor, constant: 15).isActive = true
        insideSquareLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        insideSquareContainer.addSubview(insideDividerLineView)
        insideDividerLineView.topAnchor.constraint(equalTo: insideSquareLabel.bottomAnchor, constant: 5).isActive = true
        insideDividerLineView.leadingAnchor.constraint(equalTo: insideSquareContainer.leadingAnchor, constant: 15).isActive = true
        insideDividerLineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        insideDividerLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        insideSquareContainer.addSubview(minimumSumLabel)
        minimumSumLabel.topAnchor.constraint(equalTo: insideDividerLineView.topAnchor, constant: 20).isActive = true
        minimumSumLabel.leadingAnchor.constraint(equalTo: insideSquareContainer.leadingAnchor, constant: 15).isActive = true
        
        insideSquareContainer.addSubview(deliveryCostLabel)
        deliveryCostLabel.topAnchor.constraint(equalTo: insideDividerLineView.bottomAnchor, constant: 20).isActive = true
        deliveryCostLabel.trailingAnchor.constraint(equalTo: insideSquareContainer.trailingAnchor, constant: -15).isActive = true
        
        insideSquareContainer.addSubview(freeDeliveryCostLabel)
        freeDeliveryCostLabel.topAnchor.constraint(equalTo: minimumSumLabel.bottomAnchor, constant: 20).isActive = true
        freeDeliveryCostLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        freeDeliveryCostLabel.widthAnchor.constraint(equalToConstant: insideSquareContainer.frame.width / 2 - 15).isActive = true
        
        scrollView.addSubview(outsideSquareContainer)
        outsideSquareContainer.topAnchor.constraint(equalTo: insideSquareContainer.bottomAnchor, constant: 1).isActive = true
        outsideSquareContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        outsideSquareContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        outsideSquareContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        outsideSquareContainer.addSubview(outsideSquareLabel)
        outsideSquareLabel.topAnchor.constraint(equalTo: outsideSquareContainer.topAnchor, constant: 5).isActive = true
        outsideSquareLabel.leadingAnchor.constraint(equalTo: outsideSquareContainer.leadingAnchor, constant: 15).isActive = true
        outsideSquareLabel.trailingAnchor.constraint(equalTo: outsideSquareContainer.trailingAnchor, constant: 15).isActive = true
        outsideSquareLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        outsideSquareContainer.addSubview(outsideDividerLineView)
        outsideDividerLineView.topAnchor.constraint(equalTo: outsideSquareLabel.bottomAnchor, constant: 5).isActive = true
        outsideDividerLineView.leadingAnchor.constraint(equalTo: outsideSquareContainer.leadingAnchor, constant: 15).isActive = true
        outsideDividerLineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        outsideDividerLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        outsideSquareContainer.addSubview(outsideMinimumSumLabel)
        outsideMinimumSumLabel.topAnchor.constraint(equalTo: outsideDividerLineView.bottomAnchor, constant: 10).isActive = true
        outsideMinimumSumLabel.leadingAnchor.constraint(equalTo: outsideSquareContainer.leadingAnchor, constant: 15).isActive = true
        
        outsideSquareContainer.addSubview(outsideDeliveryCostLabel)
        outsideDeliveryCostLabel.topAnchor.constraint(equalTo: outsideDividerLineView.bottomAnchor, constant: 10).isActive = true
        outsideDeliveryCostLabel.trailingAnchor.constraint(equalTo: outsideSquareContainer.trailingAnchor, constant: -15).isActive = true
        
        scrollView.addSubview(scheduleContainer)
        scheduleContainer.topAnchor.constraint(equalTo: outsideSquareContainer.bottomAnchor, constant: 1).isActive = true
        scheduleContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        scheduleContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        scheduleContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        scheduleContainer.addSubview(deliveryScheduleLabel)
        deliveryScheduleLabel.topAnchor.constraint(equalTo: scheduleContainer.topAnchor, constant: 5).isActive = true
        deliveryScheduleLabel.leadingAnchor.constraint(equalTo: scheduleContainer.leadingAnchor, constant: 15).isActive = true
        deliveryScheduleLabel.trailingAnchor.constraint(equalTo: scheduleContainer.trailingAnchor, constant: 15).isActive = true
        deliveryScheduleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scheduleContainer.addSubview(scheduleDividerLineView)
        scheduleDividerLineView.topAnchor.constraint(equalTo: deliveryScheduleLabel.bottomAnchor, constant: 5).isActive = true
        scheduleDividerLineView.leadingAnchor.constraint(equalTo: scheduleContainer.leadingAnchor, constant: 15).isActive = true
        scheduleDividerLineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        scheduleDividerLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        scheduleContainer.addSubview(deliveryScheduleInfoLabel)
        deliveryScheduleInfoLabel.topAnchor.constraint(equalTo: scheduleDividerLineView.bottomAnchor, constant: 5).isActive = true
        deliveryScheduleInfoLabel.leadingAnchor.constraint(equalTo: scheduleContainer.leadingAnchor, constant: 15).isActive = true
        deliveryScheduleInfoLabel.trailingAnchor.constraint(equalTo: scheduleContainer.trailingAnchor, constant: -5).isActive = true
        deliveryScheduleInfoLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    
    
    
}
