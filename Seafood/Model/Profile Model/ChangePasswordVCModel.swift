//
//  ChangePasswordVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit

class ChangePasswordVCModel {
    
    func handleOldPasswordAlert(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Вы ввели неправильный пароль",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    func handleNewPasswordAlert(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Пароли не совпадают",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    func handleNewPasswordCountAlert(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Пароль должен состоять не менее из 6 символов",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    func handleEmptyTextFields(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Заполните свободные поля",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
                                      }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
}
