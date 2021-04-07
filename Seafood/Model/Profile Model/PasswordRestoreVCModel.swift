//
//  PasswordRestoreVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit

class PasswordRestoreVCModel {
    
    //setting password
    func setPassword(vc: UIViewController, passwordTextField: UITextField, repeatPasswordTextField: UITextField, codeConfirmTextField: UITextField  ) {
        
        let code = "123456"
        
        guard let password = passwordTextField.text,
              let repeatedPassword = repeatPasswordTextField.text,
                let confirmCode = codeConfirmTextField.text
        else { return }
        
        if password != repeatedPassword {
            showPasswordAlert(vc: vc)
        } else if confirmCode != code {
            showConfirmCodeAlert(vc: vc)
        } else {
            
            UserDefaults.standard.removeObject(forKey: "password")
            UserDefaults.standard.setValue(password, forKey: "password")
        
            vc.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    private func showPasswordAlert(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Пароли не совпадают",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отменить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.navigationController?.popViewController(animated: true)
        }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    private func showConfirmCodeAlert(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Код подтверждения не верен",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отменить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.navigationController?.popViewController(animated: true)
        }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    //Enabling set password button
    
    func enableSetPasswordBtn(sender: UITextField, passwordTextField: UITextField, repeatPasswordTextField: UITextField, codeConfirmTextField: UITextField, setPasswordButton: UIButton, setPasswordButtonContainer: UIView ) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard let password = passwordTextField.text, password.count > 5,
              let repeatedPassword = repeatPasswordTextField.text, repeatedPassword.count > 5,
              let confirmCode = codeConfirmTextField.text, confirmCode.count > 5
        else {
            setPasswordButton.isEnabled = false
            return
        }
        setPasswordButton.isEnabled = true
        setPasswordButtonContainer.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.8901960784, alpha: 1)
        
    }
    
}
