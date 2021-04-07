//
//  ChangeInfoVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit

class ChangeInfoVCModel {
    
    func handleCancelBtn(vc: UIViewController) {
        
        let alert = UIAlertController(title: "Отменить внесенные изменения?",
                                      message: "Изменения не будут сохранены",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .default,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        vc.navigationController?.popViewController(animated: true)
        }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    func handleSaveBtn(vc: UIViewController, saveInfo: @escaping () -> Void) {
        
        let alert = UIAlertController(title: "Сохранить внесенные изменения",
                                      message: "Прежние данные будут изменены",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .default,
                                      handler: { (action) in
                                        vc.dismiss(animated: true, completion: nil)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        saveInfo()
                                        vc.navigationController?.popViewController(animated: true)
                                      }))
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
}
