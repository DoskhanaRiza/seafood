//
//  ProfileViewController.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileVCModel = ProfileVCModel()
    var observer: NSObjectProtocol?

    //IBOutlets
    unowned var profileView: ProfileView { return self.view as! ProfileView }
    unowned var loginButton: UIButton { return profileView.loginButton as UIButton }
    unowned var myAddressButton: UIButton { return profileView.myAddressButton as UIButton }
    unowned var shopAddressButton: UIButton { return profileView.shopAddressButton as UIButton }
    unowned var notificationsButton: UIButton { return profileView.notificationsButton as UIButton }
    unowned var deliveryButton: UIButton { return profileView.deliveryButton as UIButton }
    unowned var takeawayButton: UIButton { return profileView.takeawayButton as UIButton }
    unowned var supplierButton: UIButton { return profileView.supplierButton as UIButton }
    unowned var contactsButton: UIButton { return profileView.contactsButton as UIButton }
    
    override func loadView() {
        self.view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Профиль"
        handleActions()
//        handleButtonTitle()
//        loginButton.setTitle("Войти в аккаунт", for: .normal)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        handleNotifications()
        handleButtonTitle()
        handleActions()
        
    }
    
    // Handling Actions
    func handleActions() {
        
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        myAddressButton.addTarget(self, action: #selector(goToMyAddress), for: .touchUpInside)
        shopAddressButton.addTarget(self, action: #selector(goToShopAddress), for: .touchUpInside)
        notificationsButton.addTarget(self, action: #selector(goToNotifications), for: .touchUpInside)
        deliveryButton.addTarget(self, action: #selector(goToDelivery), for: .touchUpInside)
        takeawayButton.addTarget(self, action: #selector(goToTakeaway), for: .touchUpInside)
        supplierButton.addTarget(self, action: #selector(goToSupplier), for: .touchUpInside)
        contactsButton.addTarget(self, action: #selector(goToContacts), for: .touchUpInside)

    }
   
    
    //MARK: - Navigation Controller push methods
    
    @objc func handleLogin() {
        
        if loginButton.titleLabel?.text == "Войти в аккаунт" {
            goToLoginVC()
        } else {
            goToSignedInVC()
        }
    }
    
    @objc func goToSignedInVC() {
        let signedInVC = SignedInViewController()
        self.navigationController?.pushViewController(signedInVC, animated: true)
    }
    
    @objc func goToLoginVC() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }
    
    @objc func goToMyAddress() {
        let myAddressVC = MyAddressesViewController()
        self.navigationController?.pushViewController(myAddressVC, animated: true)
    }
    
    @objc func goToTakeaway() {
            let takeawayVC = TakeawayViewController()
            self.navigationController?.pushViewController(takeawayVC, animated: true)
    }
    
    @objc func goToShopAddress() {
            let addressVC = ShopAddressViewController()
            self.navigationController?.pushViewController(addressVC, animated: true)
    }
        
    @objc func goToNotifications() {
            let notificationsVC = NotificationsViewController()
            self.navigationController?.pushViewController(notificationsVC, animated: true)
    }
    
    @objc func goToDelivery() {
            let deliveryVC = DeliveryViewController()
            self.navigationController?.pushViewController(deliveryVC, animated: true)
    }
                
    @objc func goToSupplier() {
        let supplierVC = SupplierViewController()
        self.navigationController?.pushViewController(supplierVC, animated: true)
    }
                    
    @objc func goToContacts() {
        let contactsVC = ContactsViewController()
        self.navigationController?.pushViewController(contactsVC, animated: true)
    }
    
    private func goToRegisterVC() {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true, completion: nil)
    }
    
   // Handling Button title
    func handleButtonTitle() {
        profileVCModel.handleBtnTitle(loginButton: loginButton)
    }
    
    // Handling Notifications
    private func handleNotifications() {
        profileVCModel.handleNotifications(loginButton: loginButton)
    }
    
        
}



