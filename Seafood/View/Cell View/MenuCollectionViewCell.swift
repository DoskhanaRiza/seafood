//
//  MenuCollectionViewCell.swift
//  Seafood
//
//  Created by Riza on 2/22/21.
//

import UIKit
import Firebase

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCell"
    var numberCount: Int = 1
    var selectedMenus = [Menu]()
    var ref: DatabaseReference!
    var menu: Menu?
    var menuNames = [String]()
    var totalSum: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        ref = Database.database().reference()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Adding Views
        
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let menuNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("В корзину", for: .normal)
        let cartImage = UIImage(named: "cart")
        let tintedImage = cartImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let tengeLabel: UILabel = {
        let label = UILabel()
        label.text = "тг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - Functions
    
    //Add to cart button
    @objc func addToCartPressed() {
        
        addToCartButton.isHidden = true
        stepperContainer.isHidden = false
        
        let count = UserDefaults.standard.integer(forKey: "count\(menuNameLabel.text ?? "")")
        numberLabel.text = count.description
        
        addToDatabase()
        UserDefaults.standard.setValue(true, forKey: "addButton\(menuNameLabel.text ?? "")")
        
        let name = menuNameLabel.text!
        menuNames.append(name)
    }
    
    // handling minus button
    @objc func minusTapped() {
        
        numberCount = UserDefaults.standard.integer(forKey: "count\(menuNameLabel.text ?? "")")
        numberCount -= 1
        numberLabel.text = numberCount.description
        UserDefaults.standard.setValue(numberCount, forKey: "count\(menuNameLabel.text ?? "")")
        handleSum()
        handleCount()
        
        if numberCount == 0 {
            deleteFromDatabase()
            numberCount = 1
            UserDefaults.standard.setValue(1, forKey: "count\(menuNameLabel.text ?? "")")
            UserDefaults.standard.setValue(false, forKey: "addButton\(menuNameLabel.text ?? "")")
            stepperContainer.isHidden = true
            addToCartButton.isHidden = false
            numberLabel.text = numberCount.description
            minusButton.isEnabled = false
        }
                
    }
    
    // handling plus button
    @objc func plusTapped() {
        
        numberCount = UserDefaults.standard.integer(forKey: "count\(menuNameLabel.text ?? "")")
        numberCount += 1
        numberLabel.text = numberCount.description
        minusButton.isEnabled = true
        UserDefaults.standard.setValue(numberCount, forKey: "count\(menuNameLabel.text ?? "")")
        handleCount()
        handleSum()
        
    }
    
    func configureMenuCell(cell: MenuCollectionViewCell, menuArray: [Menu], indexPath: IndexPath) {
        
        let menu = menuArray[indexPath.row]
        
        cell.menuImageView.image = menu.image
        cell.menuNameLabel.text = menu.name
        cell.priceLabel.text = String(menu.price)
        
        let name = menu.name
        
        if UserDefaults.standard.bool(forKey: "addButton\(name)") {
            
            cell.addToCartButton.isHidden = true
            cell.stepperContainer.isHidden = false
            
        } else {
            
            cell.addToCartButton.isHidden = false
            cell.stepperContainer.isHidden = true
            
        }
        
        let number = UserDefaults.standard.integer(forKey: "count\(name)")
        cell.numberLabel.text = String(number)
    }
    
    //MARK: - Handling Firebase Database functions
    
    func deleteFromDatabase() {
        ref.child("selectedMenu").child(menuNameLabel.text!).removeValue()
    }
    
    func addToDatabase() {
        
        totalSum = 0
        let count = UserDefaults.standard.integer(forKey: "count\(menuNameLabel.text ?? "")")
        let price = Int(priceLabel.text ?? "")!
        let name = menuNameLabel.text!
        let sum = price * count
        let menuRef = ref.child("selectedMenu").child(name)
        let array = ["name" : name, "price" : price, "count" : count, "sum" : sum] as [String : Any]
        menuRef.updateChildValues(array)
        let orderRef = ref.child("Orders").child("OrderNumber\(1)").child("Order").child(name)
        orderRef.updateChildValues(array)
        handleSum()
        
    }
    
    func handleSum() {
        
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
                        
                        let ordersRef = self.ref.child("Orders").child("OrderNumber\(1)").child("TotalSum")
                        ordersRef.setValue(sum)
                    }
                }
                
                
            }
            
           
        }
        
    }
    
    private func handleCount() {

        numberCount = UserDefaults.standard.integer(forKey: "count\(menuNameLabel.text ?? "")")
        let price = Int(priceLabel.text ?? "")!
        let name = menuNameLabel.text!
        let sum = price * numberCount
        let menuRef = ref.child("selectedMenu").child(name)
        let dict = ["name" : name, "price" : price, "count" : numberCount, "sum" : sum] as [String : Any]
        menuRef.updateChildValues(dict)

    }
    
    //MARK: - Setting UI Functions
    
    func setupViews() {
    
        contentView.addSubview(menuImageView)
        contentView.addSubview(menuNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addToCartButton)
        
        contentView.addSubview(stepperContainer)
        stepperContainer.addSubview(minusButton)
        stepperContainer.addSubview(numberLabel)
        stepperContainer.addSubview(plusButton)
        
        stepperContainer.isHidden = true
        
        contentView.addSubview(tengeLabel)
        contentView.backgroundColor = .white
        
        menuImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height / 2)
        
        menuNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        menuNameLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 15).isActive = true
        menuNameLabel.leadingAnchor.constraint(equalTo: menuImageView.leadingAnchor, constant: 5).isActive = true

        priceLabel.bottomAnchor.constraint(equalTo: addToCartButton.topAnchor, constant: -10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        addToCartButton.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        addToCartButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addToCartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        addToCartButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        addToCartButton.addTarget(self, action: #selector(addToCartPressed), for: .touchUpInside)
        
        stepperContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        stepperContainer.heightAnchor.constraint(equalToConstant: 35).isActive = true
        stepperContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        minusButton.leadingAnchor.constraint(equalTo: stepperContainer.leadingAnchor, constant: 2).isActive = true
        minusButton.topAnchor.constraint(equalTo: stepperContainer.topAnchor, constant: 2).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: stepperContainer.bottomAnchor, constant: -2).isActive = true
        minusButton.widthAnchor.constraint(equalTo: stepperContainer.widthAnchor, multiplier: 1/3, constant: -4).isActive = true
        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        
        numberLabel.centerYAnchor.constraint(equalTo: stepperContainer.centerYAnchor).isActive = true
        numberLabel.centerXAnchor.constraint(equalTo: stepperContainer.centerXAnchor).isActive = true
        numberLabel.widthAnchor.constraint(equalTo: stepperContainer.widthAnchor, multiplier: 1/3).isActive = true
        numberLabel.text = String(numberCount)
        
        plusButton.trailingAnchor.constraint(equalTo: stepperContainer.trailingAnchor, constant: -2).isActive = true
        plusButton.topAnchor.constraint(equalTo: stepperContainer.topAnchor, constant: 2).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: stepperContainer.bottomAnchor, constant: -2).isActive = true
        plusButton.widthAnchor.constraint(equalTo: stepperContainer.widthAnchor, multiplier: 1/3, constant: -4).isActive = true
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        
        tengeLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 2).isActive = true
        tengeLabel.heightAnchor.constraint(equalTo: priceLabel.heightAnchor).isActive = true
        tengeLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        tengeLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
        
    }
    
}


