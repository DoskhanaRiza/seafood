//
//  HistoryTableViewCell.swift
//  Seafood
//
//  Created by Riza on 2/26/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    static let identifier = "HistoryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupViews()
        
    }
    
    func addViews() {
        
        contentView.addSubview(firstLine)
        contentView.addSubview(secondLine)
        contentView.addSubview(thirdLine)
        contentView.addSubview(orderNumberLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(sumLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(addressLabel)
        
    }
    
    
    func setupViews() {
        
        firstLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        firstLine.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        firstLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        firstLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        secondLine.topAnchor.constraint(equalTo: firstLine.bottomAnchor).isActive = true
        secondLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        secondLine.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80).isActive = true
        secondLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        thirdLine.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        thirdLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        thirdLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        thirdLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        orderNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        orderNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        orderNumberLabel.widthAnchor.constraint(equalToConstant: orderNumberLabel.intrinsicContentSize.width).isActive = true
        
        statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80).isActive = true
        
        sumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        sumLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        sumLabel.widthAnchor.constraint(equalToConstant: sumLabel.intrinsicContentSize.width).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: dateLabel.intrinsicContentSize.width).isActive = true
        dateLabel.topAnchor.constraint(equalTo: firstLine.bottomAnchor, constant: 25).isActive = true
        
        addressLabel.leadingAnchor.constraint(equalTo: secondLine.leadingAnchor, constant: 10).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: thirdLine.trailingAnchor, constant: -5).isActive = true
        addressLabel.topAnchor.constraint(equalTo: firstLine.bottomAnchor, constant: 25).isActive = true
    }
    
    let firstLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Отменен"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()

    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
