//
//  SupplierView.swift
//  Seafood
//
//  Created by Riza on 3/10/21.
//

import UIKit

class SupplierView: UIView {
    
    //MARK: - Adding UI
    
    let supplierInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Одной из главных задач сервиса 'Морепродукты КЗ' является расширение товарного ассортимента и возможность предоставления выгодных цен нашим Клиентам.\n\nМы всегда готовы рассматривать новые предложения о сотрудничестве и предложить взаимовыгодные партнёрские отношения с поставщиками и производителями.\n\nПредложения можете отправлять на электронный ящик 8700545000@mail.ru"
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
    
    //MARK: - Setting up Function
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.9171851277, green: 0.9205198884, blue: 0.9522905946, alpha: 1)
        
        let width = self.frame.width
        let height = supplierInfoLabel.systemLayoutSizeFitting(CGSize(width: width,
                                                                      height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        
        self.addSubview(labelContainer)
        labelContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        labelContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        labelContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        labelContainer.heightAnchor.constraint(equalToConstant: 300).isActive = true

        labelContainer.addSubview(supplierInfoLabel)
        supplierInfoLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 10).isActive = true
        supplierInfoLabel.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: 10).isActive = true
        supplierInfoLabel.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: -10).isActive = true
        supplierInfoLabel.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant: -10).isActive = true
        supplierInfoLabel.heightAnchor.constraint(equalToConstant: height + 30).isActive = true
        
    }
    
    
    
}
