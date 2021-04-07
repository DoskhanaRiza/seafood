//
//  PasswordRestoreViewController.swift
//  Seafood
//
//  Created by Riza on 2/18/21.
//

import UIKit

class PasswordRestoreViewController: UIViewController {
    
    let passwordRestoreVCModel = PasswordRestoreVCModel()
    //IBOutlets
    unowned var passwordRestoreView: PasswordRestoreView { return self.view as! PasswordRestoreView }
    unowned var setPasswordButton: UIButton { return passwordRestoreView.setPasswordButton as UIButton }
    unowned var setPasswordButtonContainer: UIView { return passwordRestoreView.setPasswordButtonContainer as UIView }
    unowned var passwordTextField: UITextField { return passwordRestoreView.passwordTextField as UITextField }
    unowned var repeatPasswordTextField: UITextField { return passwordRestoreView.repeatPasswordTextField as UITextField }
    unowned var codeConfirmTextField: UITextField { return passwordRestoreView.codeConfirmTextField as UITextField }
    unowned var cancelButton: UIButton { return passwordRestoreView.cancelButton as UIButton }

    override func loadView() {
        self.view = PasswordRestoreView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        handleTextFieldDelegates()
        handleSetPasswordButton()
        handleActions()
        
    }
    
   //Handling IBActions
    func handleActions() {
        
        setPasswordButton.addTarget(self, action: #selector(setPassword), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(goBackToPasswordVC), for: .touchUpInside)
    }
    
    //IBActions
    @objc func goBackToPasswordVC() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func setPassword() {
        
        passwordRestoreVCModel.setPassword(vc: self,
                                           passwordTextField: passwordTextField,
                                           repeatPasswordTextField: repeatPasswordTextField,
                                           codeConfirmTextField: codeConfirmTextField)
        
    }
    
    //MARK: - Handling SetPasswordButton Methods
    
    func handleSetPasswordButton() {
        
        setPasswordButton.isEnabled = false
        setPasswordButtonContainer.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        passwordTextField.addTarget(self, action: #selector(enableSetPasswordBtn), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(enableSetPasswordBtn), for: .editingChanged)
        codeConfirmTextField.addTarget(self, action: #selector(enableSetPasswordBtn), for: .editingChanged)
        
    }
    
    @objc func enableSetPasswordBtn(sender: UITextField) {
        
        passwordRestoreVCModel.enableSetPasswordBtn(sender: sender,
                                                    passwordTextField: passwordTextField,
                                                    repeatPasswordTextField: repeatPasswordTextField,
                                                    codeConfirmTextField: codeConfirmTextField,
                                                    setPasswordButton: setPasswordButton,
                                                    setPasswordButtonContainer: setPasswordButtonContainer)
    }
    
}

//MARK: - TextField extension

extension PasswordRestoreViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleTextFieldDelegates() {
        
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        codeConfirmTextField.delegate = self
        
    }
}
