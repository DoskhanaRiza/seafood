//
//  SignedInVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit
import Firebase

class SignedInVCModel {
    
    // Handling Phone Number Button
    func handlePhoneNumberButton(vc: UIViewController, phoneNumberLabel: UILabel, textField: UITextField) {
        
        handleEditPhoneNumberButton(vc: vc, phoneNumberLabel: phoneNumberLabel)
        handlePhoneTextField(textField: textField, vc: vc, phoneNumberLabel: phoneNumberLabel)
        guard let number = phoneNumberLabel.text else { return }
        saveNewNumber(number: number)
        
    }
    
    private func handleEditPhoneNumberButton(vc: UIViewController, phoneNumberLabel: UILabel) {
        
        var textField = UITextField()
                
        let alert = UIAlertController(title: "Телефон",
                                      message: "Изменить номер телефона",
                                      preferredStyle: .alert)
        
        alert.addTextField { (field) in
            
            textField = field
            self.handlePhoneTextField(textField: field,vc: vc, phoneNumberLabel: phoneNumberLabel)
            
        }
        
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .cancel,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        let newNumber = textField.text
                                        phoneNumberLabel.text = newNumber
                                        self.saveNewNumber(number: newNumber ?? "")
                                        vc.dismiss(animated: true, completion: nil)
                                      }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    private func handlePhoneTextField(textField: UITextField, vc: UIViewController, phoneNumberLabel: UILabel) {
        
        guard let text = textField.text else { return }
        textField.text = text.applyPatternOnNumbers(pattern: "+# ### ### ####", replacmentCharacter: "#")
        textField.text = phoneNumberLabel.text
        textField.placeholder = "Телефон"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.delegate = vc as? UITextFieldDelegate
        textField.keyboardType = .phonePad
        
    }
    
    private func saveNewNumber(number: String) {
        UserDefaults.standard.setValue(number, forKey: "phoneNumber")
    }
    
    //Handling EmailButton
    func handleEmailNumberBtn(vc: UIViewController, emailLabel: UILabel) {
        handleEmailNumberButton(vc: vc, emailLabel: emailLabel)
        handleEmailTextField(textField: UITextField(), vc: vc)
        guard  let email = emailLabel.text else { return }
        saveNewEmail(email: email)
    }
    
    
    private func handleEmailNumberButton(vc: UIViewController, emailLabel: UILabel) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "E-mail",
                                      message: "Изменить адрес электронной почты",
                                      preferredStyle: .alert)
        
        alert.addTextField { (field) in
            textField = field
            
            self.handleEmailTextField(textField: field, vc: vc)
            
        }
        
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .cancel,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        let newEmail = textField.text
                                        emailLabel.text = newEmail
                                        self.saveNewEmail(email: newEmail ?? "")
                                        vc.dismiss(animated: true, completion: nil)
                                      }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    private func handleEmailTextField(textField: UITextField,vc: UIViewController) {
        
        textField.placeholder = "Электронная почта"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.delegate = vc as? UITextFieldDelegate
        
    }
    
    private func saveNewEmail(email: String) {
        UserDefaults.standard.setValue(email, forKey: "newEmail")
    }
    
    //Handling More Btn
    func handleMoreButton(vc: UIViewController) {
        
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Сменить пароль",
                                      style: .default,
                                      handler: { (action) in
                                        self.goToChangePasswordVC(vc: vc)
        }))
        
        alert.addAction(UIAlertAction(title: "Выйти из аккаунта",
                                      style: .default,
                                      handler: { (action) in
                                        self.logout(vc: vc)
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .cancel,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    private func goToChangePasswordVC(vc: UIViewController) {
        
        let changePasswordVC = ChangePasswordViewController()
        vc.navigationController?.pushViewController(changePasswordVC, animated: true)
        
    }
    
    private func logout(vc: UIViewController) {

            do {
                try Auth.auth().signOut()
                vc.navigationController?.popToRootViewController(animated: true)
                // sending "Войти в аккаунт"
                NotificationCenter.default.post(name: Notification.Name(rawValue: "account"), object: "Войти в аккаунт", userInfo: nil)
                UserDefaults.standard.setValue("Войти в аккаунт", forKey: "buttonTitle")
                print("logged out")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
    
    }
    
    //Showing Profile Data
    func showAllData(phoneNumberLabel: UILabel, emailLabel: UILabel, profileImageView: UIImageView, vc: SignedInViewController) {
        
        showNewNumber(phoneNumberLabel: phoneNumberLabel)
        showNewEmail(emailLabel: emailLabel)
        showProfileImage(profileImageView: profileImageView, vc: vc)
        
    }
    
    private func showProfileImage(profileImageView: UIImageView, vc: SignedInViewController) {
        
        if let image = UserDefaults.standard.data(forKey: "newImage") {
            let newImage = UIImage(data: image)
            profileImageView.image = newImage
            vc.image = newImage
        }
        

    }
    
    private func showNewEmail(emailLabel: UILabel) {
        if let newEmail = UserDefaults.standard.string(forKey: "newEmail") {
            emailLabel.text = newEmail
        }
    }
    
    private func showNewNumber(phoneNumberLabel: UILabel) {
        if let newNumber = UserDefaults.standard.string(forKey: "phoneNumber") {
            phoneNumberLabel.text = newNumber
        }
    }
}
