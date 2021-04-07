//
//  LoginVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit
import Firebase

class LoginVCModel {
    
    func enableConfirmButton(sender: UITextField,
                             phoneNumberTextField: UITextField,
                             confrimButton: UIButton,
                             confirmButtonContainer: UIView,
                             vc: UIViewController,
                             ref: DatabaseReference ) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
       
        guard let number = phoneNumberTextField.text else { return }
        phoneNumberTextField.text = number.applyPatternOnNumbers(pattern: "+# ### ### ####", replacmentCharacter: "#")
        
        if number.count == 15 {
            
            confrimButton.isEnabled = true
            confirmButtonContainer.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.8901960784, alpha: 1)
            handleConfirmButtonFirebase(phoneNumber: number,
                                        ref: ref,
                                        vc: vc,
                                        phoneNumberTextField: phoneNumberTextField,
                                        confrimButton: confrimButton,
                                        confirmButtonContainer: confirmButtonContainer)
                
        } else {
            confrimButton.isEnabled = false
        }
       
    }
    
    // check if the number is registered
    private func handleConfirmButtonFirebase(phoneNumber: String,
                                             ref: DatabaseReference,
                                             vc: UIViewController,
                                             phoneNumberTextField: UITextField,
                                             confrimButton: UIButton,
                                             confirmButtonContainer: UIView ) {
        
        let userRef = ref.child("users").child("user")
        userRef.observeSingleEvent(of: .value, with: { [self] (snapshot) in
            
            if snapshot.exists() {
                
                let values = snapshot.value as! [String : Any]

                if let number = values["number"] {

                    if number as? String == phoneNumber {

                        confrimButton.isEnabled = true
                        confirmButtonContainer.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.8901960784, alpha: 1)

                    } else {
                        showRegisterAlert(vc: vc, phoneNumberTextField: phoneNumberTextField)
                    }
                }
                
            } else {
                showRegisterAlert(vc: vc, phoneNumberTextField: phoneNumberTextField)
            }
                                        
        })
        
    }
    
    private func showRegisterAlert(vc: UIViewController, phoneNumberTextField: UITextField) {
        
        let alert = UIAlertController(title: "Мы не нашли вас!", message: "Хотите пройти регистрацию?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .default,
                                      handler: { (action) in
                                        vc.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        self.goToRegisterVC(phoneNumberTextField: phoneNumberTextField, vc: vc)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    private func goToRegisterVC(phoneNumberTextField: UITextField, vc: UIViewController) {
        
        guard let number = phoneNumberTextField.text else { return }
        let registerVC = RegisterViewController()
        registerVC.phoneNumberLabel.text = number
        registerVC.modalPresentationStyle = .fullScreen
        vc.present(registerVC, animated: true, completion: nil)
       
    }
    
    func goToPasswordVC(vc: UIViewController) {
        
        let passwordVC = PasswordViewController()
        passwordVC.modalPresentationStyle = .fullScreen
        vc.present(passwordVC, animated: true, completion: nil)

    }
    
}
