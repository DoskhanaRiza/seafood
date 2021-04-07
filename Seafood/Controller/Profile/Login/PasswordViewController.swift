//
//  PasswordViewController.swift
//  Seafood
//
//  Created by Riza on 2/18/21.
//

import UIKit

class PasswordViewController: UIViewController {
        
    let passwordVCModel = PasswordVCModel()
    // IBOutlets
    unowned var passwordView: PasswordView { return self.view as! PasswordView }
    unowned var passwordTextField: UITextField { return passwordView.passwordTextField as UITextField }
    unowned var enterButton: UIButton { return passwordView.enterButton as UIButton }
    unowned var enterButtonContainer: UIView { return passwordView.enterButtonContainer as UIView }
    unowned var cancelButton: UIButton { return passwordView.cancelButton as UIButton }
    unowned var forgetPasswordButton: UIButton { return passwordView.forgetPasswordButton as UIButton }
    
    override func loadView() {
        self.view = PasswordView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleTextFieldDelegates()
        handleEnterButton()
        handleActions()
        
    }
    
    func handleActions() {
        
        enterButton.addTarget(self, action: #selector(enterTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(goBackToLoginVC), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(goToPasswordRestoreVC), for: .touchUpInside)
        
    }
    
    //MARK: - @objc Functions
    
    @objc func goToPasswordRestoreVC() {
        
        let passwordRestoreVC = PasswordRestoreViewController()
        passwordRestoreVC.modalPresentationStyle = .fullScreen
        present(passwordRestoreVC, animated: true, completion: nil)
        
    }
    
    @objc func goBackToLoginVC() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func enterTapped() {
        passwordVCModel.enterTapped(passwordTextField: passwordTextField, vc: self)
    }

    // handling enter button
    func handleEnterButton() {
        
        enterButton.isEnabled = false
        enterButtonContainer.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        passwordTextField.addTarget(self, action: #selector(enableEnterBtn), for: .editingChanged)
        
    }
    
    @objc func enableEnterBtn(sender: UITextField) {
        passwordVCModel.enableEnterButton(sender: sender,
                                          passwordTextField: passwordTextField,
                                          enterButton: enterButton,
                                          enterButtonContainer: enterButtonContainer)
    }

}

//MARK: - TextField Extension

extension PasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleTextFieldDelegates() {
        passwordTextField.delegate = self
        
    }
}

//MARK: - UITabBarControllerDelegate Extension

extension PasswordViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        
        if let navigationController = viewController as? UINavigationController {
            navigationController.popToRootViewController(animated: true)
        }
        return true
    }
}
