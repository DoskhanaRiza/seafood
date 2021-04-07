//
//  SignedInViewController.swift
//  Seafood
//
//  Created by Riza on 2/20/21.
//

import UIKit
import Firebase

protocol SetButtonTitle {
    func setButtonTitle(name: String, surname: String, patronymic: String)
}

class SignedInViewController: UIViewController, UITextFieldDelegate {

    let signedInVCModel = SignedInVCModel()
    let profileDataModel = ProfileDataModel()
    var setButtonTitleDelegate: SetButtonTitle?
    var observer: NSObjectProtocol?
    var name: String?
    var surname: String?
    var image: UIImage?
    var patronymic: String?
    
    //IBOutlets
    unowned var signedInView: SignedInView { return self.view as! SignedInView }
    unowned var tableView: UITableView { return signedInView.tableView as UITableView }
    unowned var phoneNumberLabel: UILabel { return signedInView.phoneNumberLabel as UILabel}
    unowned var emailLabel: UILabel { return signedInView.emailLabel as UILabel }
    unowned var nameLabel: UILabel { return signedInView.nameLabel as UILabel }
    unowned var moreButton: UIButton { return signedInView.moreButton as UIButton }
    unowned var changeButton: UIButton { return signedInView.changeButton as UIButton }
    unowned var editPhoneNumberButton: UIButton { return signedInView.editPhoneNumberButton as UIButton }
    unowned var editEmailButton: UIButton { return signedInView.editEmailButton as UIButton }
    unowned var profileImageView: UIImageView { return signedInView.profileImageView as UIImageView }
    
    override func loadView() {
        self.view = SignedInView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        showAllInfo()
        handleActions()
        handleNavigationItem()
        
    }
    
    //Handle Actions
    func handleActions() {
        
        changeButton.addTarget(self, action: #selector(goToChangeInfoVC), for: .touchUpInside)
        editPhoneNumberButton.addTarget(self, action: #selector(handleEditPhoneNumberButton), for: .touchUpInside)
        editEmailButton.addTarget(self, action: #selector(handleEmailNumberButton), for: .touchUpInside)
        
    }
    
    //MARK: - @objc methods
    
    @objc func goToChangeInfoVC() {
        
        let changeInfoVC = ChangeInfoViewController()
        
        changeInfoVC.nameTextField.text = name
        changeInfoVC.surnameTextField.text = surname
        changeInfoVC.patronymicTextField.text = patronymic
        changeInfoVC.profileImageView.image = image
        changeInfoVC.profileInfoDelegate = self
        
        self.navigationController?.pushViewController(changeInfoVC, animated: true)
    }
    
    func handleNavigationItem() {
        
        navigationItem.title = "Личный профиль"
        moreButton.addTarget(self, action: #selector(handleMoreButton), for: .touchUpInside)
        let moreBtn = UIBarButtonItem(customView: moreButton)
        self.navigationItem.rightBarButtonItem = moreBtn
        
    }
    
    //Handling Buttons
    
    @objc func handleEditPhoneNumberButton() {
        signedInVCModel.handlePhoneNumberButton(vc: self, phoneNumberLabel: phoneNumberLabel, textField: UITextField())
    }
    
    @objc func handleEmailNumberButton() {
        signedInVCModel.handleEmailNumberBtn(vc: self, emailLabel: emailLabel)
    }
    
    @objc func handleMoreButton() {
        signedInVCModel.handleMoreButton(vc: self)
    }
    
    //Showing Profile Data
    
    func showAllInfo() {
        signedInVCModel.showAllData(phoneNumberLabel: phoneNumberLabel, emailLabel: emailLabel, profileImageView: profileImageView, vc: self)
    }
   
}

//MARK: - Table View Extension

extension SignedInViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDataModel.creditCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell {
            
            let model = profileDataModel.creditCards[indexPath.row]
            cell.settingsLabel.text = model.title
            let creditCard = UIImage(named: "credit-card")
            cell.iconImageView.image = creditCard
            
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let creditCardsVC = CreditCardsViewController()
        self.navigationController?.pushViewController(creditCardsVC, animated: true)
        
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

//MARK: - Profile Info Protocol

extension SignedInViewController: ProfileInfo {
    
    func saveProfileInfo(name: String, surname: String, patronymic: String, image: UIImage) {
        
        nameLabel.text = "\(surname) \(name) \(patronymic)"
        profileImageView.image = image
        self.image = image

    }
    
}

//MARK: - Text Field Extension

extension UIAlertController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
