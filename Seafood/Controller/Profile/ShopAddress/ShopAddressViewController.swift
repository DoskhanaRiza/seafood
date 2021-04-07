//
//  AddressViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class ShopAddressViewController: UIViewController {
    
    var models = [AddressSections]()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        navigationItem.title = "Наши адреса"
        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        setupTableView()
        
    }
    
    func configure() {
        
        models.append(AddressSections(options: [
            Address(title: "Морепродукты КЗ", detailsText: ""),
            Address(title: "Открыто\nг. Алматы, пр.Гагарина, 236Б", detailsText: "")
        ]))
        
    }
    
    
}

extension ShopAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.identifier,
                                                    for: indexPath) as? AddressTableViewCell {
            
            let model = models[indexPath.section].options[indexPath.row]
            cell.addressLabel.text = model.title
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let addressDetailsVC = ShopAddressDetailsViewController()
        self.navigationController?.pushViewController(addressDetailsVC, animated: true)
        
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    
}
