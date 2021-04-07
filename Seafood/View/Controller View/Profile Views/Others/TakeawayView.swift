//
//  TakeawayView.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class TakeawayView: UIView {
    
    //MARK: - Adding UI
    
    let takeawayInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы сможете забрать свой заказ самостоятельно в нашем магазине по адресу: г. Алматы, пр. Гагарина, 236Б, магазин 'Жарим-Варим' до 20:00 в рабочие дни магазина.\n\nЕсли Вы решили отправить курьера, то убедитесь, что он успеет забрать заказ до закрытия магазина.\n\nЕсли Вы не успеваете забрать заказ в назначенное время, просим сообщить об этом менедежеру. Просроченные и неоплаченные заказы закрываются автомачитески."
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    //MARK: - init Functions
    
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
        
        self.backgroundColor = #colorLiteral(red: 0.9171851277, green: 0.9205198884, blue: 0.9522905946, alpha: 1)
        
        let width = self.frame.width
        let height = takeawayInfoLabel.systemLayoutSizeFitting(CGSize(width: width,
                                                                      height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        
        self.addSubview(labelContainer)
        labelContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        labelContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        labelContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        labelContainer.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        labelContainer.addSubview(takeawayInfoLabel)
        takeawayInfoLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 10).isActive = true
        takeawayInfoLabel.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: 10).isActive = true
        takeawayInfoLabel.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: -10).isActive = true
        takeawayInfoLabel.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant: -10).isActive = true
        takeawayInfoLabel.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    
}
