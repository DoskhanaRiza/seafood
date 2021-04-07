//
//  PasswordVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit

class PasswordVCModel {
    
    func enterTapped(passwordTextField: UITextField, vc: UIViewController) {
        
        let setPassword = UserDefaults.standard.string(forKey: "password")
//        print(setPassword)
//        guard let setPassword = UserDefaults.standard.string(forKey: "password") else { return }
        guard let password = passwordTextField.text else { return }
        print("enter tapped")
        if password.count > 5, password != setPassword {
            showPasswordAlert(vc: vc)
        } else {
            sendTitleToButton()
            vc.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            print("dismissed")
            
        }
    }
    
    // sending name to ProfileVC button title
    private func sendTitleToButton() {

        if let name = UserDefaults.standard.string(forKey: "newName"),
           let surname = UserDefaults.standard.string(forKey: "newSurname"),
           let patronymic = UserDefaults.standard.string(forKey: "newPatronymic") {
            
            let newName = "\(surname) \(name) \(patronymic)"
            NotificationCenter.default.post(name: Notification.Name(rawValue: "button"), object: newName, userInfo: nil)
            print("name sent")
            print("newName is \(newName)")
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "button"), object: "Пользователь", userInfo: nil)
            print("user sent")
            print("no name saved")
        }
    }
    
    private func showPasswordAlert(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Вы ввели неправильный пароль",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.navigationController?.popViewController(animated: true)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    //enabling enter btn
    func enableEnterButton(sender: UITextField, passwordTextField: UITextField, enterButton: UIButton, enterButtonContainer: UIView ) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard let setPassword = UserDefaults.standard.string(forKey: "password") else { return }
        guard let password = passwordTextField.text else { return }
        
        if password.count > 5, password == setPassword {
            enterButton.isEnabled = true
            enterButtonContainer.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.8901960784, alpha: 1)
//            print(setPassword)

        }  else {
            enterButton.isEnabled = false
            enterButtonContainer.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        
        
    }
    
}
