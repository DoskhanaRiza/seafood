//
//  CartTableViewCell.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit
import Firebase

class CartTableViewCell: UITableViewCell {
    
    static let identifier = "CartCell"
    var numberCount: Int = 1
    var ref: DatabaseReference!
    var totalSum: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        ref = Database.database().reference()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    func addViews() {
        
        contentView.addSubview(foodImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceTextLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(deleteButton)
        
        contentView.addSubview(stepperContainer)
        stepperContainer.addSubview(minusButton)
        stepperContainer.addSubview(numberLabel)
        stepperContainer.addSubview(plusButton)
        
        contentView.backgroundColor = .white
        
    }
    
    func setupViews() {
        
        foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        foodImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        priceTextLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 10).isActive = true
        priceTextLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -10).isActive = true
        priceTextLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        stepperContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stepperContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stepperContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        stepperContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        minusButton.leadingAnchor.constraint(equalTo: stepperContainer.leadingAnchor, constant: 2).isActive = true
        minusButton.topAnchor.constraint(equalTo: stepperContainer.topAnchor, constant: 2).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: stepperContainer.bottomAnchor, constant: -2).isActive = true
        minusButton.widthAnchor.constraint(equalTo: stepperContainer.widthAnchor, multiplier: 1/3, constant: -4).isActive = true
        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        
        numberLabel.centerYAnchor.constraint(equalTo: stepperContainer.centerYAnchor).isActive = true
        numberLabel.centerXAnchor.constraint(equalTo: stepperContainer.centerXAnchor).isActive = true
        numberLabel.widthAnchor.constraint(equalTo: stepperContainer.widthAnchor, multiplier: 1/3).isActive = true
        numberLabel.text = numberCount.description
        
        plusButton.trailingAnchor.constraint(equalTo: stepperContainer.trailingAnchor, constant: -2).isActive = true
        plusButton.topAnchor.constraint(equalTo: stepperContainer.topAnchor, constant: 2).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: stepperContainer.bottomAnchor, constant: -2).isActive = true
        plusButton.widthAnchor.constraint(equalTo: stepperContainer.widthAnchor, multiplier: 1/3, constant: -4).isActive = true
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        
        deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: stepperContainer.trailingAnchor, constant: 10).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        deleteButton.addTarget(self, action: #selector(deleteFromDatabase), for: .touchUpInside)
        
    }
    
    let foodImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let priceTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Цена:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.text = "2500"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    let stepperContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.blue.cgColor
        return view
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "minus"), for: .normal)
        return button
    }()
    
    @objc func minusTapped() {
        
        numberCount -= 1
        numberLabel.text = numberCount.description
        fetchSum()
        assignSum()
        handleCountSum()
        if numberCount == 0 {
            deleteFromDatabase()
        }
        
    }
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    
    @objc func plusTapped() {
        
        fetchSum()
        numberCount += 1
        numberLabel.text = numberCount.description
        minusButton.isEnabled = true
        handleCountSum()
        assignSum()
        
    }
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    @objc let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "delete"), for: .normal)
        return button
    }()
    
    //MARK: - Functions
    
    func configureCell(with cell: CartTableViewCell, at indexPath: IndexPath, with array: [Menu]) {
        
        let menu = array[indexPath.row]
        
        numberCount = menu.count
        UserDefaults.standard.setValue(numberCount, forKey: "count\(menu.name)")
        cell.numberLabel.text = menu.count.description
        cell.foodImageView.image = UIImage(named: "\(menu.name)")
        cell.nameLabel.text = menu.name
        cell.priceLabel.text = String(menu.price)
        
    }
    
    
    @objc func deleteFromDatabase() {
        print("delete pressed")
        
        fetchSum()
        assignSum()
        handleCountSum()
        ref.child("selectedMenu").child(nameLabel.text!).removeValue()
        
        let orderedRef = ref.child("Orders").child("OrderNumber\(1)").child("Order").child(nameLabel.text!)
        orderedRef.removeValue()
        
        let sumRef = ref.child("selectedMenu").child("totalSum")
        sumRef.removeValue()
        
        // sending object as notification to CartVC to delete from selectedMenus array
        NotificationCenter.default.post(name: Notification.Name("deletion"), object: nameLabel.text, userInfo: nil)
        
        UserDefaults.standard.setValue(1, forKey: "count\(nameLabel.text!)")
        UserDefaults.standard.setValue(false, forKey: "addButton\(nameLabel.text!)")
        
    }
    
}


extension CartTableViewCell {
    
    //getting sum from database
    private func fetchSum() {
        totalSum = 0
        let sumRef = ref.child("selectedMenu").child("totalSum")
        sumRef.observeSingleEvent(of: .value) { [self] (snapshot) in
            if let sum = snapshot.value as? Int {
                self.totalSum = sum
                
            }
            
        }
        
    }
    
    // sending sum from database to CartVC's sum label
    func assignSum() {
        
        totalSum = 0
        var newSum = 0
        
        let mref = ref.child("selectedMenu")
        mref.observeSingleEvent(of: .value) { (snapshot) in
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                if let menu = snap.value as? [String : Any] {
                    
                    if let sum = menu["sum"] as? Int{
                        newSum += sum
                        self.totalSum = newSum
                        
                        let sumRef = self.ref.child("selectedMenu").child("totalSum")
                        let sum = self.totalSum
                        sumRef.setValue(sum)
                        
                        let orderSumRef = self.ref.child("Orders").child("OrderNumber\(1)").child("TotalSum")
                        orderSumRef.setValue(sum)
                        
                        // sending sum notification to CartVC
                        NotificationCenter.default.post(name: Notification.Name("sum"), object: self.totalSum, userInfo: nil)
                        
                        
                    }
                    
                }
            }
            
            
        }
        
    }
    
    // updating count and sum in database
    private func handleCountSum() {
        
        totalSum = 0
        let price = Int(priceLabel.text ?? "")!
        let name = nameLabel.text!
        let sum = price * numberCount
        
        NotificationCenter.default.post(name: Notification.Name(name), object: numberCount, userInfo: nil)
        
        // adding menus to selected list
        let menuRef = ref.child("selectedMenu").child(name)
        let dict = ["name" : name, "price" : price, "count" : numberCount, "sum" : sum] as [String : Any]
        menuRef.updateChildValues(dict)
        
        // updating menus in ordered list
        let orderedRef = ref.child("Orders").child("OrderNumber\(1)").child("Order").child(name)
        let ordered = [ "count" : numberCount, "name" : name, "price" : price, "sum" : sum] as [String : Any]
        orderedRef.updateChildValues(ordered)
        
        
    }
}
