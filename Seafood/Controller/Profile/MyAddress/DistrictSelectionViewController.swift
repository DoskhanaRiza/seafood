//
//  DistrictSelectionViewController.swift
//  Seafood
//
//  Created by Riza on 2/19/21.
//

import UIKit

protocol SelectedDistrict {
    func selectDistrict(district: Address)
}

class DistrictSelectionViewController: UIViewController {
    
    let dataModel = ProfileDataModel()
    var selectedDistrictDelegate: SelectedDistrict?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        
        cancelButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        let cancelBtn = UIBarButtonItem(customView: cancelButton)
        self.navigationItem.leftBarButtonItem = cancelBtn
        
        view.addSubview(tableView)
        navigationItem.title = "Выбор района"
        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        self.navigationItem.hidesBackButton = true
        
    }
    
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

    
}

//MARK: - Table View Extension

extension DistrictSelectionViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.districtsDetails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.identifier,
                                                    for: indexPath) as? AddressTableViewCell {
            
            let model = dataModel.districtsDetails[indexPath.row]
            cell.addressLabel.text = model.title
            
            return cell
        }
        
        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let district = dataModel.districtsDetails[indexPath.row].title
        let selectedDistrict = Address(title: "Район", detailsText: district)
        selectedDistrictDelegate?.selectDistrict(district: selectedDistrict)
        popVC()
        
    }
    
}
