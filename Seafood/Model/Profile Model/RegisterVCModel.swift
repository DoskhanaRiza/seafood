//
//  RegisterVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit

class RegisterVCModel {
    
    func showPasswordAlert(vc: UIViewController) {
        
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
    
    func goToFillinVC(vc: UIViewController) {
        
        let fillInVC = FillinDataViewController()
        
        fillInVC.modalPresentationStyle = .fullScreen
        vc.present(fillInVC, animated: true, completion: nil)
        
    }
    
}
