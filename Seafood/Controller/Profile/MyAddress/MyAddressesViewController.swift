//
//  MyAddressesViewController.swift
//  Seafood
//
//  Created by Riza on 2/18/21.
//

import UIKit

class MyAddressesViewController: UIViewController {

    var savedAddress: String?
    var savedDistrict: String?
    var savedStreet: String?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MyAddressTableViewCell.self, forCellReuseIdentifier: MyAddressTableViewCell.identifier)
        return tableView
    }()
    
    // IBOutlets
    unowned var myAddressView: MyAddressView { return self.view as! MyAddressView }
    unowned var addButton: UIButton { return myAddressView.addButton as UIButton }
    
    override func loadView() {
        self.view = MyAddressView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        navigationItem.title = "Мои адреса"
        handleViews()
        showSavedAddress()
        setupNavigationItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleViews()
        showSavedAddress()
        
    }
    
    //MARK: - Functions

    func handleViews() {
        
        if ((savedAddress) == nil && (savedDistrict) == nil && (savedStreet) == nil) {
            myAddressView.setupEmptyView()
        } else {
            setupFiiledView()
        }
        
    }
    
    func setupNavigationItem() {
        
        addButton.addTarget(self, action: #selector(goToAddAddressVC), for: .touchUpInside)
        let goToCartButton = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = goToCartButton
        
    }
    
    func changeAddress() {

        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Удалить адрес",
                                      style: .destructive,
                                      handler: { (action) in
                                        self.deleteAddresses()
                                        self.myAddressView.setupEmptyView()
                                        self.tableView.isHidden = true
                                      }))

        alert.addAction(UIAlertAction(title: "Редактировать адрес",
                                      style: .default,
                                      handler: { (action) in
                                        self.goToAddAddressVC()
                                      }))

        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .cancel,
                                      handler: { (action) in
                                        self.dismiss(animated: true, completion: nil)
                                      }))

        self.present(alert, animated: true, completion: nil)

    }
    
    func deleteAddresses() {
        
        UserDefaults.standard.removeObject(forKey: "address")
        UserDefaults.standard.removeObject(forKey: "district")
        UserDefaults.standard.removeObject(forKey: "street")
        
    }
    
    @objc func goToAddAddressVC() {
        
        let addAddressVC = AddMyAddressViewController()
        addAddressVC.saveMyAddressDelegate = self
        self.navigationController?.pushViewController(addAddressVC, animated: true)
        
    }
    
    func showSavedAddress() {

        if let address = UserDefaults.standard.string(forKey: "address") {
            savedAddress = address
        }

        if let district = UserDefaults.standard.string(forKey: "district") {
            savedDistrict = district
        }

        if let street = UserDefaults.standard.string(forKey: "street") {
            savedStreet = street
        }
        
    }
    
}

//MARK: - Table View Extension

extension MyAddressesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MyAddressTableViewCell.identifier,
                                                    for: indexPath) as? MyAddressTableViewCell {
            
            cell.addressLabel.text = "Город\n\(savedDistrict ?? "")"
            cell.secondaryAddressLabel.text = "\(savedAddress ?? "")\n\(savedStreet ?? "")"
            
            return cell
                        
        }
        
        return MyAddressTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if ((savedAddress) == nil && (savedDistrict) == nil && (savedStreet) == nil) {
            
            let addMyAddressVC = AddMyAddressViewController()
            self.navigationController?.pushViewController(addMyAddressVC, animated: true)
            
        } else {
            changeAddress()
        }
        
    }
    
    func setupFiiledView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    
}

//MARK: - Save Address Protocol

extension MyAddressesViewController: SaveMyAddress {
    
    func saveAddress(address: String, district: String, street: String) {
        
        savedAddress = address
        savedDistrict = district
        savedStreet = street
        
    }
    
}



