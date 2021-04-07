//
//  AddAddressViewController.swift
//  Seafood
//
//  Created by Riza on 2/18/21.
//

import UIKit

protocol SaveMyAddress {
    func saveAddress(address: String, district: String, street: String)
}

class AddMyAddressViewController: UIViewController {
    
    let profileDataModel = ProfileDataModel()
    var districtCell: String?
    var saveMyAddressDelegate: SaveMyAddress?
    //IBOutlets
    unowned var addMyAddressView: AddMyAddressView { return self.view as! AddMyAddressView }
    unowned var tableView: UITableView { return addMyAddressView.tableView as UITableView }
    unowned var addressTF: UITextField { return addMyAddressView.addressTextField as UITextField }
    unowned var streetTF: UITextField { return addMyAddressView.streetTextField as UITextField }
    unowned var homeTF: UITextField { return addMyAddressView.homeTextField as UITextField }
    unowned var apartmentTF: UITextField { return addMyAddressView.apartmentTextField as UITextField }
    unowned var entranceTF: UITextField { return addMyAddressView.entranceTextField as UITextField }
    unowned var floorTF: UITextField { return addMyAddressView.floorTextField as UITextField }
    unowned var intercomTF: UITextField { return addMyAddressView.intercomTextField as UITextField }
    unowned var saveButton: UIButton { return addMyAddressView.saveButton as UIButton }
    
    override func loadView() {
        self.view = AddMyAddressView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        navigationItem.title = "Новый адрес"
        handleTextFieldsDelegates()
        setupTableView()
        setupNavigationItem()
        
    }
    
 
    
    //MARK: - Functions
    
    @objc func goToDistrictSelection() {
        
        let districtSelectionVC = DistrictSelectionViewController()
        districtSelectionVC.selectedDistrictDelegate = self
        self.navigationController?.pushViewController(districtSelectionVC, animated: true)
        
    }
    
    @objc func handleNewAddress() {
        
        if (addressTF.text) == nil ||
            (districtCell) == nil ||
            (streetTF.text) == nil ||
            (homeTF.text) == nil {
            
            handleEmptyTextFields()
            
        } else {
            
            saveMyAddressDelegate?.saveAddress(address: addressTF.text ?? "",
                                               district: districtCell ?? "",
                                               street: streetTF.text ?? "")
            
            saveNewAddress()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func saveNewAddress() {
        
        UserDefaults.standard.setValue(addressTF.text, forKey: "address")
        UserDefaults.standard.setValue(districtCell, forKey: "district")
        UserDefaults.standard.setValue(streetTF.text, forKey: "street")
        UserDefaults.standard.setValue(homeTF.text, forKey: "home")
        
    }
    
    @objc func handleEmptyTextFields() {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Заполните cвободные поля",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func setupNavigationItem() {
        
        saveButton.addTarget(self, action: #selector(handleNewAddress), for: .touchUpInside)
        let saveBtn = UIBarButtonItem(customView: saveButton)
        self.navigationItem.rightBarButtonItem = saveBtn
        
    }
    
    
}

extension AddMyAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDataModel.districts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MyAddressTableViewCell.identifier,
                                                    for: indexPath) as? MyAddressTableViewCell {
            
            let model = profileDataModel.districts[indexPath.row]
            
            cell.addressLabel.text = model.title
            cell.secondaryAddressLabel.text = model.detailsText
            cell.secondaryAddressLabel.textColor = .lightGray
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        goToDistrictSelection()
        
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
}


extension AddMyAddressViewController: SelectedDistrict {
    
    func selectDistrict(district: Address) {
        
        profileDataModel.districts.removeAll()
        profileDataModel.districts.append(district)
        districtCell = district.detailsText
        tableView.reloadData()
        
    }
    
}

//MARK: - Text Field Delegate

extension AddMyAddressViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleTextFieldsDelegates() {
        
        addressTF.delegate = self
        streetTF.delegate = self
        homeTF.delegate = self
        apartmentTF.delegate = self
        entranceTF.delegate = self
        floorTF.delegate = self
        intercomTF.delegate = self
        
    }
    
}


